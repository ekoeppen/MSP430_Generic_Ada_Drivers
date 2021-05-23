with System;
with Interfaces; use Interfaces;
with MSPGD.Board; use MSPGD.Board;
with Drivers.Text_IO;
with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.ADC10; use MSP430_SVD.ADC10;

procedure Main is

   pragma Preelaborate;

   package Text_IO is new Drivers.Text_IO (USART => UART);

   Info_C : array (Unsigned_16 range 0 .. 31) of Unsigned_16 with Address => System'To_Address (16#10C0#);

   procedure Show_Info_C is
   begin
      for I of Info_C loop
         Text_IO.Put_Hex (Unsigned_32 (I)); Text_IO.Put (" ");
      end loop;
      Text_IO.New_Line;
   end Show_Info_C;

   type ADC_Calibration_Data_Type is record
      ADC_Gain_Factor : Unsigned_16;
      ADC_Offset : Unsigned_16;
      ADC_15VRef_Factor : Unsigned_16;
      ADC_15T30 : Unsigned_16;
      ADC_15T85 : Unsigned_16;
      ADC_25VRef_Factor : Unsigned_16;
      ADC_25T30 : Unsigned_16;
      ADC_25T85 : Unsigned_16;
   end record;

   procedure Get_ADC_Calibration (Data : out ADC_Calibration_Data_Type) is
      I : Unsigned_16 range Info_C'Range := Info_C'First + 1;
      Tag : Unsigned_16;
      Len : Unsigned_16;
   begin
      loop
         Tag := Info_C (I) and 16#FF#;
         Len := Info_C (I) / (2 ** 9);
         if I + Len >= Info_C'Last then exit; end if;
         if Tag = 16#10# then
            Data.ADC_Gain_Factor := Info_C (I + 1);
            Data.ADC_Offset := Info_C (I + 2);
            Data.ADC_15VRef_Factor := Info_C (I + 3);
            Data.ADC_15T30 := Info_C (I + 4);
            Data.ADC_15T85 := Info_C (I + 5);
            Data.ADC_25VRef_Factor := Info_C (I + 6);
            Data.ADC_25T30 := Info_C (I + 7);
            Data.ADC_25T85 := Info_C (I + 8);
         end if;
         I := I + Len + 1;
      end loop;
   end Get_ADC_Calibration;

   function Read_Temp_ADC return Unsigned_16 is
   begin
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      ADC10_Periph.ADC10CTL1.INCH := Inch_10;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_1, ADC10SHT => Adc10Sht_3, REFON => 1, ADC10ON => 1, ENC => 1, others => 0);
      ADC10_Periph.ADC10CTL0.ADC10SC := 1;
      while ADC10_Periph.ADC10CTL1.ADC10BUSY = 1 loop null; end loop;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      return Unsigned_16 (ADC10_Periph.ADC10MEM);
   end Read_Temp_ADC;

   function Read_Voltage_ADC return Unsigned_16 is
      ADC : Unsigned_16;
      Voltage : Unsigned_32;
   begin
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      ADC10_Periph.ADC10CTL1.INCH := Inch_11;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_1, ADC10SHT => Adc10Sht_3, REFON => 1, ADC10ON => 1, ENC => 1, others => 0);
      ADC10_Periph.ADC10CTL0.ADC10SC := 1;
      while ADC10_Periph.ADC10CTL1.ADC10BUSY = 1 loop null; end loop;
      ADC := Unsigned_16 (ADC10_Periph.ADC10MEM);
      if ADC > 16#0380# then
         ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
         ADC10_Periph.ADC10CTL0 := (SREF => Sref_1, ADC10SHT => Adc10Sht_3, REF2_5V => 1, REFON => 1, ENC => 1, ADC10ON => 1, others => 0);
         ADC10_Periph.ADC10CTL0.ADC10SC := 1;
         while ADC10_Periph.ADC10CTL1.ADC10BUSY = 1 loop null; end loop;
         ADC := Unsigned_16 (ADC10_Periph.ADC10MEM);
         Voltage := (Unsigned_32 (ADC) * 5 * 125) / 128;
      else
         Voltage := (Unsigned_32 (ADC) * 3 * 125) / 128;
      end if;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      return Unsigned_16 (Voltage);
   end Read_Voltage_ADC;

   Calibration_Data : ADC_Calibration_Data_Type;
   Calib_Offset : Integer_32;
   Calib_Scale : Integer_32;
   Input: String (1 .. 16);
   Input_Len : Integer;

   procedure Print_Calibration_Data is
   begin
      Text_IO.Put_Hex (Unsigned_32 (Calibration_Data.ADC_15VRef_Factor)); Text_IO.New_Line;
      Text_IO.Put_Hex (Unsigned_32 (Calibration_Data.ADC_15T30)); Text_IO.New_Line;
      Text_IO.Put_Hex (Unsigned_32 (Calibration_Data.ADC_15T85)); Text_IO.New_Line;
   end Print_Calibration_Data;

   procedure Print_Temperature is
      ADC_Value : Unsigned_16;
      Temp : Integer_32;
      Calib_Temp : Unsigned_16;
   begin
      ADC_Value := Read_Temp_ADC;
      Temp := (Integer_32 (ADC_Value) * 27069 - 18169625) / 2 ** 16;
      --  Calib_Temp := (Integer_32 (ADC_Value) * Calib_Scale + Calib_Offset) / 2 ** 16;
      Calib_Temp := (ADC_Value - Calibration_Data.ADC_15T30)
         * (55 / (Calibration_Data.ADC_15T85 - Calibration_Data.ADC_15T30))
         + 30;
      Text_IO.Put_Hex (Unsigned_32 (ADC_Value)); Text_IO.Put (" ");
      Text_IO.Put_Hex (Unsigned_32 (Temp)); Text_IO.Put (" ");
      Text_IO.Put_Hex (Unsigned_32 (Calib_Temp)); Text_IO.New_Line;
   end Print_Temperature;

   procedure Print_Voltage is
      Voltage : Unsigned_16;
   begin
      Voltage := Read_Voltage_ADC;
      Text_IO.Put_Hex (Unsigned_32 (Voltage)); Text_IO.New_Line;
   end Print_Voltage;

begin
   Init;
   Text_IO.Put_Line ("Internal temperature/voltage sensor readings");
   --  Show_Info_C;
   Get_ADC_Calibration (Calibration_Data);
   Calib_Scale := 3604480 / Integer_32 (Calibration_Data.ADC_15T85 - Calibration_Data.ADC_15T30);
   Calib_Offset := 1998848 - Integer_32 (Calibration_Data.ADC_15T30) * Calib_Scale;
   loop
      Text_IO.Put_Line ("Press <enter> to read data");
      Text_IO.Get_Line (Input, Input_Len);
      Print_Temperature;
      Print_Voltage;
   end loop;

end Main;
