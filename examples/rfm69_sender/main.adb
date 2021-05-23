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

procedure Main is

   pragma Preelaborate;

   package IRQ is new MSPGD.GPIO.Pin (Port => 2, Pin => 2);
   package Text_IO is new Drivers.Text_IO (USART => UART);
   package Radio is new Drivers.RFM69 (SPI => SPI, Chip_Select => SSEL, IRQ => IRQ, Packet_Size => 62, Frequency => 915_000_000);
   package Delay_Clock is new MSPGD.Clock.Source (Frequency => 3000, Input => VLO, Source => ACLK);
   package NTC is new Drivers.NTC;

   procedure Print_Registers is new Radio.Print_Registers(Put_Line => Text_IO.Put_Line);

   procedure TX_Test is
      TX_Data : Radio.Packet_Type;
      Input : String (1 .. 16);
      Len : Natural;
      Counter : Unsigned_8 := 0;
      Temperature, Voltage : Unsigned_32;
      Send_Temperature : Boolean := True;
   begin
      TX_Data (1) := 16#D8#; TX_Data (2) := 16#40#; TX_Data (3) := 16#1A#;
      loop
         --  Text_IO.Get_Line (Input, Len);
         Temperature := NTC.Value (Integer (Read_NTC));
         Voltage := Unsigned_32 (Read_VCC);
         Text_IO.Put ("NTC value: ");
         Text_IO.Put_Hex (Temperature);
         Text_IO.Put (" Voltage: ");
         Text_IO.Put_Hex (Voltage);
         Text_IO.New_Line;

         if Send_Temperature then
            TX_Data (4) := Unsigned_8 ((Temperature / 2 ** 24) mod 2 ** 8);
            TX_Data (5) := Unsigned_8 ((Temperature / 2 ** 16) mod 2 ** 8);
            TX_Data (6) := Unsigned_8 ((Temperature / 2 ** 8) mod 2 ** 8);
            TX_Data (7) := Unsigned_8 (Temperature mod 2 ** 8);
         else
            TX_Data (4) := Unsigned_8 ((Voltage / 2 ** 24) mod 2 ** 8);
            TX_Data (5) := Unsigned_8 ((Voltage / 2 ** 16) mod 2 ** 8);
            TX_Data (6) := Unsigned_8 ((Voltage / 2 ** 8) mod 2 ** 8);
            TX_Data (7) := Unsigned_8 (Voltage mod 2 ** 8);
         end if;
         Send_Temperature := not Send_Temperature;
         Radio.TX (TX_Data);
         -- Print_Registers;

         Counter := Counter + 1; if Counter > 23 then Counter := 0; end if;
         Radio.Power_Down;
         Delay_Clock.Delay_Slow_Periods (1);
      end loop;
   end TX_Test;

   procedure Sleep_Test is
   begin
      Radio.Power_Down;
      while true loop
         Delay_Clock.Delay_Slow_Periods (1);
      end loop;
   end Sleep_Test;

begin
   Init;
   Delay_Clock.Init;
   SPI.Init;
   SCLK.Init;
   MISO.Init;
   MOSI.Init;
   SSEL.Init;
   IRQ.Init;
   SSEL.Set;
   Text_IO.Put_Line ("RFM69 sender starting...");
   Radio.Init;
   Text_IO.Put_Hex (Unsigned_32 (Read_NTC)); Text_IO.New_Line;
   Text_IO.Put_Hex (Unsigned_32 (Read_VCC)); Text_IO.New_Line;
   Print_Registers;
   TX_Test;
   --  Sleep_Test;
end Main;
