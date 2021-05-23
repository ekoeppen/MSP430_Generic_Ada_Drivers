--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  ADC10
package MSP430_SVD.ADC10 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  ADC10 Data Transfer Control 0
   type ADC10DTC0_Register is record
      --  This bit should normally be reset
      ADC10FETCH   : MSP430_SVD.Bit := 16#0#;
      --  ADC10 block one
      ADC10B1      : MSP430_SVD.Bit := 16#0#;
      --  ADC10 continuous transfer
      ADC10CT      : MSP430_SVD.Bit := 16#0#;
      --  ADC10 two-block mode
      ADC10TB      : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_4_7 : MSP430_SVD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for ADC10DTC0_Register use record
      ADC10FETCH   at 0 range 0 .. 0;
      ADC10B1      at 0 range 1 .. 1;
      ADC10CT      at 0 range 2 .. 2;
      ADC10TB      at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  ADC10 Sample Hold Select Bit: 0
   type ADC10CTL0_ADC10SHT_Field is
     (--  4 x ADC10CLKs
      Adc10Sht_0,
      --  8 x ADC10CLKs
      Adc10Sht_1,
      --  16 x ADC10CLKs
      Adc10Sht_2,
      --  64 x ADC10CLKs
      Adc10Sht_3)
     with Size => 2;
   for ADC10CTL0_ADC10SHT_Field use
     (Adc10Sht_0 => 0,
      Adc10Sht_1 => 1,
      Adc10Sht_2 => 2,
      Adc10Sht_3 => 3);

   --  ADC10 Reference Select Bit: 0
   type ADC10CTL0_SREF_Field is
     (--  VR+ = AVCC and VR- = AVSS
      Sref_0,
      --  VR+ = VREF+ and VR- = AVSS
      Sref_1,
      --  VR+ = VEREF+ and VR- = AVSS
      Sref_2,
      --  VR+ = VEREF+ and VR- = AVSS
      Sref_3,
      --  VR+ = AVCC and VR- = VREF-/VEREF-
      Sref_4,
      --  VR+ = VREF+ and VR- = VREF-/VEREF-
      Sref_5,
      --  VR+ = VEREF+ and VR- = VREF-/VEREF-
      Sref_6,
      --  VR+ = VEREF+ and VR- = VREF-/VEREF-
      Sref_7)
     with Size => 3;
   for ADC10CTL0_SREF_Field use
     (Sref_0 => 0,
      Sref_1 => 1,
      Sref_2 => 2,
      Sref_3 => 3,
      Sref_4 => 4,
      Sref_5 => 5,
      Sref_6 => 6,
      Sref_7 => 7);

   --  ADC10 Control 0
   type ADC10CTL0_Register is record
      --  ADC10 Start Conversion
      ADC10SC  : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Enable Conversion
      ENC      : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Interrupt Flag
      ADC10IFG : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Interrupt Enalbe
      ADC10IE  : MSP430_SVD.Bit := 16#0#;
      --  ADC10 On/Enable
      ADC10ON  : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Reference on
      REFON    : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Ref 0:1.5V / 1:2.5V
      REF2_5V  : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Multiple SampleConversion
      MSC      : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Reference Burst Mode
      REFBURST : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Enalbe output of Ref.
      REFOUT   : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Sampling Rate 0:200ksps / 1:50ksps
      ADC10SR  : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Sample Hold Select Bit: 0
      ADC10SHT : ADC10CTL0_ADC10SHT_Field := MSP430_SVD.ADC10.Adc10Sht_0;
      --  ADC10 Reference Select Bit: 0
      SREF     : ADC10CTL0_SREF_Field := MSP430_SVD.ADC10.Sref_0;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for ADC10CTL0_Register use record
      ADC10SC  at 0 range 0 .. 0;
      ENC      at 0 range 1 .. 1;
      ADC10IFG at 0 range 2 .. 2;
      ADC10IE  at 0 range 3 .. 3;
      ADC10ON  at 0 range 4 .. 4;
      REFON    at 0 range 5 .. 5;
      REF2_5V  at 0 range 6 .. 6;
      MSC      at 0 range 7 .. 7;
      REFBURST at 0 range 8 .. 8;
      REFOUT   at 0 range 9 .. 9;
      ADC10SR  at 0 range 10 .. 10;
      ADC10SHT at 0 range 11 .. 12;
      SREF     at 0 range 13 .. 15;
   end record;

   --  ADC10 Conversion Sequence Select 0
   type ADC10CTL1_CONSEQ_Field is
     (--  Single channel single conversion
      Conseq_0,
      --  Sequence of channels
      Conseq_1,
      --  Repeat single channel
      Conseq_2,
      --  Repeat sequence of channels
      Conseq_3)
     with Size => 2;
   for ADC10CTL1_CONSEQ_Field use
     (Conseq_0 => 0,
      Conseq_1 => 1,
      Conseq_2 => 2,
      Conseq_3 => 3);

   --  ADC10 Clock Source Select Bit: 0
   type ADC10CTL1_ADC10SSEL_Field is
     (--  ADC10OSC
      Adc10Ssel_0,
      --  ACLK
      Adc10Ssel_1,
      --  MCLK
      Adc10Ssel_2,
      --  SMCLK
      Adc10Ssel_3)
     with Size => 2;
   for ADC10CTL1_ADC10SSEL_Field use
     (Adc10Ssel_0 => 0,
      Adc10Ssel_1 => 1,
      Adc10Ssel_2 => 2,
      Adc10Ssel_3 => 3);

   --  ADC10 Clock Divider Select Bit: 0
   type ADC10CTL1_ADC10DIV_Field is
     (--  ADC10 Clock Divider Select 0
      Adc10Div_0,
      --  ADC10 Clock Divider Select 1
      Adc10Div_1,
      --  ADC10 Clock Divider Select 2
      Adc10Div_2,
      --  ADC10 Clock Divider Select 3
      Adc10Div_3,
      --  ADC10 Clock Divider Select 4
      Adc10Div_4,
      --  ADC10 Clock Divider Select 5
      Adc10Div_5,
      --  ADC10 Clock Divider Select 6
      Adc10Div_6,
      --  ADC10 Clock Divider Select 7
      Adc10Div_7)
     with Size => 3;
   for ADC10CTL1_ADC10DIV_Field use
     (Adc10Div_0 => 0,
      Adc10Div_1 => 1,
      Adc10Div_2 => 2,
      Adc10Div_3 => 3,
      Adc10Div_4 => 4,
      Adc10Div_5 => 5,
      Adc10Div_6 => 6,
      Adc10Div_7 => 7);

   --  ADC10 Sample/Hold Source Bit: 0
   type ADC10CTL1_SHS_Field is
     (--  ADC10SC
      Shs_0,
      --  TA3 OUT1
      Shs_1,
      --  TA3 OUT0
      Shs_2,
      --  TA3 OUT2
      Shs_3)
     with Size => 2;
   for ADC10CTL1_SHS_Field use
     (Shs_0 => 0,
      Shs_1 => 1,
      Shs_2 => 2,
      Shs_3 => 3);

   --  ADC10 Input Channel Select Bit: 0
   type ADC10CTL1_INCH_Field is
     (--  Selects Channel 0
      Inch_0,
      --  Selects Channel 1
      Inch_1,
      --  Selects Channel 2
      Inch_2,
      --  Selects Channel 3
      Inch_3,
      --  Selects Channel 4
      Inch_4,
      --  Selects Channel 5
      Inch_5,
      --  Selects Channel 6
      Inch_6,
      --  Selects Channel 7
      Inch_7,
      --  Selects Channel 8
      Inch_8,
      --  Selects Channel 9
      Inch_9,
      --  Selects Channel 10
      Inch_10,
      --  Selects Channel 11
      Inch_11,
      --  Selects Channel 12
      Inch_12,
      --  Selects Channel 13
      Inch_13,
      --  Selects Channel 14
      Inch_14,
      --  Selects Channel 15
      Inch_15)
     with Size => 4;
   for ADC10CTL1_INCH_Field use
     (Inch_0 => 0,
      Inch_1 => 1,
      Inch_2 => 2,
      Inch_3 => 3,
      Inch_4 => 4,
      Inch_5 => 5,
      Inch_6 => 6,
      Inch_7 => 7,
      Inch_8 => 8,
      Inch_9 => 9,
      Inch_10 => 10,
      Inch_11 => 11,
      Inch_12 => 12,
      Inch_13 => 13,
      Inch_14 => 14,
      Inch_15 => 15);

   --  ADC10 Control 1
   type ADC10CTL1_Register is record
      --  ADC10 BUSY
      ADC10BUSY : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Conversion Sequence Select 0
      CONSEQ    : ADC10CTL1_CONSEQ_Field := MSP430_SVD.ADC10.Conseq_0;
      --  ADC10 Clock Source Select Bit: 0
      ADC10SSEL : ADC10CTL1_ADC10SSEL_Field := MSP430_SVD.ADC10.Adc10Ssel_0;
      --  ADC10 Clock Divider Select Bit: 0
      ADC10DIV  : ADC10CTL1_ADC10DIV_Field := MSP430_SVD.ADC10.Adc10Div_0;
      --  ADC10 Invert Sample Hold Signal
      ISSH      : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Data Format 0:binary 1:2's complement
      ADC10DF   : MSP430_SVD.Bit := 16#0#;
      --  ADC10 Sample/Hold Source Bit: 0
      SHS       : ADC10CTL1_SHS_Field := MSP430_SVD.ADC10.Shs_0;
      --  ADC10 Input Channel Select Bit: 0
      INCH      : ADC10CTL1_INCH_Field := MSP430_SVD.ADC10.Inch_0;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for ADC10CTL1_Register use record
      ADC10BUSY at 0 range 0 .. 0;
      CONSEQ    at 0 range 1 .. 2;
      ADC10SSEL at 0 range 3 .. 4;
      ADC10DIV  at 0 range 5 .. 7;
      ISSH      at 0 range 8 .. 8;
      ADC10DF   at 0 range 9 .. 9;
      SHS       at 0 range 10 .. 11;
      INCH      at 0 range 12 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  ADC10
   type ADC10_Peripheral is record
      --  ADC10 Data Transfer Control 0
      ADC10DTC0 : aliased ADC10DTC0_Register;
      --  ADC10 Data Transfer Control 1
      ADC10DTC1 : aliased MSP430_SVD.Byte;
      --  ADC10 Analog Enable 0
      ADC10AE0  : aliased MSP430_SVD.Byte;
      --  ADC10 Control 0
      ADC10CTL0 : aliased ADC10CTL0_Register;
      --  ADC10 Control 1
      ADC10CTL1 : aliased ADC10CTL1_Register;
      --  ADC10 Memory
      ADC10MEM  : aliased MSP430_SVD.UInt16;
      --  ADC10 Data Transfer Start Address
      ADC10SA   : aliased MSP430_SVD.UInt16;
   end record
     with Volatile;

   for ADC10_Peripheral use record
      ADC10DTC0 at 16#0# range 0 .. 7;
      ADC10DTC1 at 16#1# range 0 .. 7;
      ADC10AE0  at 16#2# range 0 .. 7;
      ADC10CTL0 at 16#168# range 0 .. 15;
      ADC10CTL1 at 16#16A# range 0 .. 15;
      ADC10MEM  at 16#16C# range 0 .. 15;
      ADC10SA   at 16#174# range 0 .. 15;
   end record;

   --  ADC10
   ADC10_Periph : aliased ADC10_Peripheral
     with Import, Address => ADC10_Base;

end MSP430_SVD.ADC10;
