with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.ADC10; use MSP430_SVD.ADC10;
with MSP430_SVD.PORT_1_2; use MSP430_SVD.PORT_1_2;
with System;
with Startup;

package body MSPGD.Board is

   P1DIR : Byte;
   P1SEL : Byte;
   P1SEL2 : Byte;
   P1OUT : Byte;
   P1REN : Byte;

   procedure Init is
   begin
      Clock.Init;
      LED.Init;
      LED2.Init;
      RX.Init;
      TX.Init;
      BUTTON.Init;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      SSEL.Init;
      IRQ.Init;
      UART.Init;
      SPI.Init;
   end Init;

   procedure Power_Up is
   begin
      PORT_1_2_Periph.P1DIR.Val := P1DIR;
      PORT_1_2_Periph.P1SEL.Val := P1SEL;
      PORT_1_2_Periph.P1SEL2.Val := P1SEL2;
      PORT_1_2_Periph.P1OUT.Val := P1OUT;
      PORT_1_2_Periph.P1REN.Val := P1REN;
   end Power_Up;

   procedure Power_Down is
   begin
      P1DIR := PORT_1_2_Periph.P1DIR.Val;
      P1SEL := PORT_1_2_Periph.P1SEL.Val;
      P1SEL2 := PORT_1_2_Periph.P1SEL2.Val;
      P1OUT := PORT_1_2_Periph.P1OUT.Val;
      P1REN := PORT_1_2_Periph.P1REN.Val;
      PORT_1_2_Periph.P1DIR.Arr := (others => 0);
      PORT_1_2_Periph.P1SEL.Arr := (others => 0);
      PORT_1_2_Periph.P1SEL2.Arr := (others => 0);
      PORT_1_2_Periph.P1OUT.Arr := (0, 0, 0, 0, 0, 1, 1, 1);
      PORT_1_2_Periph.P1REN.Arr := (0, 0, 0, 0, 0, 1, 1, 1);
   end Power_Down;

   function Read_NTC return Unsigned_16 is
   begin
      ADC10_Periph.ADC10AE0 := 2#0000_0001#;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      ADC10_Periph.ADC10CTL1.INCH := Inch_0;
      ADC10_Periph.ADC10CTL1.ADC10DIV := Adc10Div_7;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_1, ADC10SHT => Adc10Sht_3, REFON => 1, REFOUT => 1, ADC10ON => 1, ENC => 1, others => 0);
      ADC10_Periph.ADC10CTL0.ADC10SC := 1;
      while ADC10_Periph.ADC10CTL0.ADC10IFG = 0 loop null; end loop;
      ADC10_Periph.ADC10CTL0.ENC := 0;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      ADC10_Periph.ADC10AE0 := 2#0000_0000#;
      return Unsigned_16 (ADC10_Periph.ADC10MEM);
   end Read_NTC;

   function Read_VCC return Unsigned_16 is
      ADC : Unsigned_16;
      Voltage : Unsigned_32;
   begin
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      ADC10_Periph.ADC10CTL1.INCH := Inch_11;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_1, ADC10SHT => Adc10Sht_3, REFON => 1, ADC10ON => 1, ENC => 1, others => 0);
      ADC10_Periph.ADC10CTL0.ADC10SC := 1;
      while ADC10_Periph.ADC10CTL1.ADC10BUSY = 1 loop null; end loop;
      ADC10_Periph.ADC10CTL0.ENC := 0;
      ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
      ADC := Unsigned_16 (ADC10_Periph.ADC10MEM);
      if ADC > 16#0380# then
         ADC10_Periph.ADC10CTL0 := (SREF => Sref_1, ADC10SHT => Adc10Sht_3, REF2_5V => 1, REFON => 1, ENC => 1, ADC10ON => 1, others => 0);
         ADC10_Periph.ADC10CTL1.INCH := Inch_11;
         ADC10_Periph.ADC10CTL1.ADC10DIV := Adc10Div_7;
         ADC10_Periph.ADC10CTL0.ADC10SC := 1;
         while ADC10_Periph.ADC10CTL0.ADC10IFG = 0 loop null; end loop;
         ADC10_Periph.ADC10CTL0.ENC := 0;
         ADC10_Periph.ADC10CTL0 := (SREF => Sref_0, ADC10SHT => Adc10Sht_0, others => 0);
         ADC := Unsigned_16 (ADC10_Periph.ADC10MEM);
         Voltage := (Unsigned_32 (ADC) * 5 * 125) / 128;
      else
         Voltage := (Unsigned_32 (ADC) * 3 * 125) / 128;
      end if;
      return Unsigned_16 (Voltage);
   end Read_VCC;

end MSPGD.Board;
