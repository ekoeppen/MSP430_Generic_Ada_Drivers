with System.Storage_Elements; use System.Storage_Elements;
with MSP430_SVD; use MSP430_SVD;
with MSPGD.Board; use MSPGD.Board;
with MSPGD.Clock; use MSPGD.Clock;
with MSPGD.Clock.Source;
with MSPGD.GPIO; use MSPGD.GPIO;
with MSPGD.GPIO.Pin;
with Drivers.Text_IO;
with Drivers.NTC;
with Drivers.RFM69;
with Interfaces; use Interfaces;
with CBOR_Codec;

procedure Main is

   pragma Preelaborate;

   Sensor_Reading_Tag : constant Natural := 6;
   Voltage_Tag        : constant Natural := 7;
   Temperature_Tag    : constant Natural := 8;
   Humidity_Tag       : constant Natural := 9;
   Pressure_Tag       : constant Natural := 10;
   Lux_Tag            : constant Natural := 11;
   UV_Index_Tag       : constant Natural := 12;
   Motion_Tag         : constant Natural := 13;
   Sound_Level_Tag    : constant Natural := 14;
   CO2_Tag            : constant Natural := 15;

   Test_Packet_Tag    : constant Natural := 64;
   Heartbeat_Tag      : constant Natural := 65;
   Log_Message_Tag    : constant Natural := 66;
   Ping_Tag           : constant Natural := 67;
   Register_Value_Tag : constant Natural := 68;
   Error_Message_Tag  : constant Natural := 69;
   Status_Cmd_Tag     : constant Natural := 256;
   Ping_Cmd_Tag       : constant Natural := 257;
   Reset_Cmd_Tag      : constant Natural := 258;

   type R_To_T is record
      R : Unsigned_32;
      T : Integer;
   end record;

   package Text_IO is new Drivers.Text_IO (USART => UART);
   package Radio is new Drivers.RFM69 (SPI => SPI, Chip_Select => SSEL, IRQ => IRQ, Packet_Size => 62, Frequency => 868_000_000);
   package Delay_Clock is new MSPGD.Clock.Source (Frequency => 3000, Input => VLO, Source => ACLK);
   package NTC is new Drivers.NTC;

   TX_Data : Radio.Packet_Type;
   TX_Data_Index : Radio.Packet_Size_Type;

   type Config_Record_Type is
      record
         Node_ID : String (1 .. 4);
         Version : String (1 .. 3);
         TX_Power : Radio.Output_Power_Type;
         TX_Interval : Unsigned_8;
      end record;

   Config_Record : aliased Config_Record_Type with Import, Convention => Asm, External_Name => "__info_start";

   function TX_Power return Radio.Output_Power_Type is
   begin
      if Config_Record.TX_Power < Radio.Output_Power_Type'First then
         return Radio.Output_Power_Type'First;
      elsif Config_Record.TX_Power > Radio.Output_Power_Type'Last then
         return Radio.Output_Power_Type'Last;
      end if;
      return Radio.Output_Power_Type (Config_Record.TX_Power);
   end TX_Power;

   function TX_Interval return Unsigned_16 is
   begin
      if Config_Record.TX_Interval = 0 then
         return 1;
      end if;
      return Unsigned_16 (Config_Record.TX_Interval);
   end TX_Interval;

   procedure Write_Data (Data : Unsigned_8) is
   begin
      TX_Data (TX_Data_Index) := Data;
      TX_Data_Index := TX_Data_Index + 1;
   end Write_Data;

   function Read_Data return Unsigned_8 is
   begin
      return 0;
   end Read_Data;

   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   package CBOR is new CBOR_Codec (Write => Write_Data, Read => Read_Data);

   function NTC_To_Temperature (NTC_Value : Unsigned_32) return Integer is
      NTC_Table_b3380 : constant array (1 .. 28) of R_To_T := (
         (0, 1000),
         (4096, 505),
         (6144, 384),
         (8192, 303),
         (10240, 244),
         (12288, 197),
         (14336, 158),
         (16384, 126),
         (18432, 97),
         (20480, 73),
         (22528, 51),
         (24576, 31),
         (26624, 13),
         (28672, -3),
         (30720, -19),
         (32768, -33),
         (40960, -80),
         (49152, -117),
         (57344, -148),
         (65536, -174),
         (73728, -197),
         (81920, -217),
         (90112, -234),
         (98304, -250),
         (106496, -265),
         (114688, -278),
         (122880, -290),
         (Unsigned_32'Last, -500));
      Index : Integer := NTC_Table_b3380'Last;
      Prev, Next : R_To_T;
      D : Unsigned_32;
   begin
      for I in NTC_Table_b3380'Range loop
         Index := I;
         exit when NTC_Table_b3380 (I).R > NTC_Value;
      end loop;
      Prev := NTC_Table_b3380 (Index - 1);
      Next := NTC_Table_b3380 (Index);
      D := Unsigned_32 (Prev.T - Next.T) * (NTC_Value - Prev.R) / (Next.R - Prev.R);
      return Prev.T - Integer (D);
   end NTC_To_Temperature;

   procedure Transmit_Loop (Interval : Unsigned_16) is
      NTC_Value : Unsigned_32;
      Temperature : Integer;
      Voltage : Unsigned_16;
   begin
      loop
         LED.Set;
         NTC_Value := NTC.Value (Integer (Read_NTC));
         Temperature := NTC_To_Temperature (NTC_Value);
         Voltage := Read_VCC;
         Text_IO.Put ("NTC value: ");
         Text_IO.Put_Hex (NTC_Value);
         Text_IO.Put (" Temperature: ");
         Text_IO.Put_Integer (Temperature);
         Text_IO.Put (" Voltage: ");
         Text_IO.Put_Integer (Integer (Voltage));
         Text_IO.New_Line;

         TX_Data_Index := Radio.Packet_Size_Type'First;
         CBOR.Encode_Tag (Sensor_Reading_Tag);
         CBOR.Encode_Array (3);
         CBOR.Encode_Byte_String (Config_Record.Node_ID);
         CBOR.Encode_Tag (Voltage_Tag);
         CBOR.Encode_Decimal_Fraction (Integer (Voltage), -3);
         CBOR.Encode_Tag (Temperature_Tag);
         CBOR.Encode_Decimal_Fraction (Temperature, -1);
         LED.Clear;
         Radio.TX (TX_Data, TX_Data_Index - 1);
         Radio.Power_Down;
         Power_Down;
         Delay_Clock.Delay_Slow_Periods (Interval);
         Power_Up;
      end loop;
   end Transmit_Loop;

begin
   Init;
   Delay_Clock.Init;
   SSEL.Set;
   Text_IO.Put_Line ("RFM69 sender starting...");
   Text_IO.Put ("Node: " & Config_Record.Node_ID & " Interval: ");
   Text_IO.Put_Integer (Integer (Config_Record.TX_Interval));
   Text_IO.New_Line;
   Radio.Init;
   Radio.Set_Output_Power (TX_Power);
   Print_Registers;
   Transmit_Loop (TX_Interval);
end Main;
