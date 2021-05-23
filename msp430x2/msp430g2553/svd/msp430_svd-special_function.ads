--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Special Function
package MSP430_SVD.SPECIAL_FUNCTION is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt Enable 1
   type IE1_Register is record
      --  Watchdog Interrupt Enable
      WDTIE        : MSP430_SVD.Bit := 16#0#;
      --  Osc. Fault Interrupt Enable
      OFIE         : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_2_3 : MSP430_SVD.UInt2 := 16#0#;
      --  NMI Interrupt Enable
      NMIIE        : MSP430_SVD.Bit := 16#0#;
      --  Flash Access Violation Interrupt Enable
      ACCVIE       : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_6_7 : MSP430_SVD.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for IE1_Register use record
      WDTIE        at 0 range 0 .. 0;
      OFIE         at 0 range 1 .. 1;
      Reserved_2_3 at 0 range 2 .. 3;
      NMIIE        at 0 range 4 .. 4;
      ACCVIE       at 0 range 5 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  Interrupt Enable 2
   type IE2_Register is record
      --  UCA0RXIE
      UCA0RXIE     : MSP430_SVD.Bit := 16#0#;
      --  UCA0TXIE
      UCA0TXIE     : MSP430_SVD.Bit := 16#0#;
      --  UCB0RXIE
      UCB0RXIE     : MSP430_SVD.Bit := 16#0#;
      --  UCB0TXIE
      UCB0TXIE     : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_4_7 : MSP430_SVD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for IE2_Register use record
      UCA0RXIE     at 0 range 0 .. 0;
      UCA0TXIE     at 0 range 1 .. 1;
      UCB0RXIE     at 0 range 2 .. 2;
      UCB0TXIE     at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  Interrupt Flag 1
   type IFG1_Register is record
      --  Watchdog Interrupt Flag
      WDTIFG       : MSP430_SVD.Bit := 16#0#;
      --  Osc. Fault Interrupt Flag
      OFIFG        : MSP430_SVD.Bit := 16#0#;
      --  Power On Interrupt Flag
      PORIFG       : MSP430_SVD.Bit := 16#0#;
      --  Reset Interrupt Flag
      RSTIFG       : MSP430_SVD.Bit := 16#0#;
      --  NMI Interrupt Flag
      NMIIFG       : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_5_7 : MSP430_SVD.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for IFG1_Register use record
      WDTIFG       at 0 range 0 .. 0;
      OFIFG        at 0 range 1 .. 1;
      PORIFG       at 0 range 2 .. 2;
      RSTIFG       at 0 range 3 .. 3;
      NMIIFG       at 0 range 4 .. 4;
      Reserved_5_7 at 0 range 5 .. 7;
   end record;

   --  Interrupt Flag 2
   type IFG2_Register is record
      --  UCA0RXIFG
      UCA0RXIFG    : MSP430_SVD.Bit := 16#0#;
      --  UCA0TXIFG
      UCA0TXIFG    : MSP430_SVD.Bit := 16#0#;
      --  UCB0RXIFG
      UCB0RXIFG    : MSP430_SVD.Bit := 16#0#;
      --  UCB0TXIFG
      UCB0TXIFG    : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_4_7 : MSP430_SVD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for IFG2_Register use record
      UCA0RXIFG    at 0 range 0 .. 0;
      UCA0TXIFG    at 0 range 1 .. 1;
      UCB0RXIFG    at 0 range 2 .. 2;
      UCB0TXIFG    at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Special Function
   type SPECIAL_FUNCTION_Peripheral is record
      --  Interrupt Enable 1
      IE1  : aliased IE1_Register;
      --  Interrupt Enable 2
      IE2  : aliased IE2_Register;
      --  Interrupt Flag 1
      IFG1 : aliased IFG1_Register;
      --  Interrupt Flag 2
      IFG2 : aliased IFG2_Register;
   end record
     with Volatile;

   for SPECIAL_FUNCTION_Peripheral use record
      IE1  at 16#0# range 0 .. 7;
      IE2  at 16#1# range 0 .. 7;
      IFG1 at 16#2# range 0 .. 7;
      IFG2 at 16#3# range 0 .. 7;
   end record;

   --  Special Function
   SPECIAL_FUNCTION_Periph : aliased SPECIAL_FUNCTION_Peripheral
     with Import, Address => SPECIAL_FUNCTION_Base;

end MSP430_SVD.SPECIAL_FUNCTION;
