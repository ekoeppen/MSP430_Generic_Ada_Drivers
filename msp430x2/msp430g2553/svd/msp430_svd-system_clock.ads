--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  System Clock
package MSP430_SVD.SYSTEM_CLOCK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  XIN/XOUT Cap 0
   type BCSCTL3_XCAP_Field is
     (--  XIN/XOUT Cap : 0 pF
      Xcap_0,
      --  XIN/XOUT Cap : 6 pF
      Xcap_1,
      --  XIN/XOUT Cap : 10 pF
      Xcap_2,
      --  XIN/XOUT Cap : 12.5 pF
      Xcap_3)
     with Size => 2;
   for BCSCTL3_XCAP_Field use
     (Xcap_0 => 0,
      Xcap_1 => 1,
      Xcap_2 => 2,
      Xcap_3 => 3);

   --  Mode 0 for LFXT1 (XTS = 0)
   type BCSCTL3_LFXT1S_Field is
     (--  Mode 0 for LFXT1 : Normal operation
      Lfxt1S_0,
      --  Mode 1 for LFXT1 : Reserved
      Lfxt1S_1,
      --  Mode 2 for LFXT1 : VLO
      Lfxt1S_2,
      --  Mode 3 for LFXT1 : Digital input signal
      Lfxt1S_3)
     with Size => 2;
   for BCSCTL3_LFXT1S_Field use
     (Lfxt1S_0 => 0,
      Lfxt1S_1 => 1,
      Lfxt1S_2 => 2,
      Lfxt1S_3 => 3);

   --  Mode 0 for XT2
   type BCSCTL3_XT2S_Field is
     (--  Mode 0 for XT2 : 0.4 - 1 MHz
      Xt2S_0,
      --  Mode 1 for XT2 : 1 - 4 MHz
      Xt2S_1,
      --  Mode 2 for XT2 : 2 - 16 MHz
      Xt2S_2,
      --  Mode 3 for XT2 : Digital input signal
      Xt2S_3)
     with Size => 2;
   for BCSCTL3_XT2S_Field use
     (Xt2S_0 => 0,
      Xt2S_1 => 1,
      Xt2S_2 => 2,
      Xt2S_3 => 3);

   --  Basic Clock System Control 3
   type BCSCTL3_Register is record
      --  Low/high Frequency Oscillator Fault Flag
      LFXT1OF : MSP430_SVD.Bit := 16#0#;
      --  High frequency oscillator 2 fault flag
      XT2OF   : MSP430_SVD.Bit := 16#0#;
      --  XIN/XOUT Cap 0
      XCAP    : BCSCTL3_XCAP_Field := MSP430_SVD.SYSTEM_CLOCK.Xcap_0;
      --  Mode 0 for LFXT1 (XTS = 0)
      LFXT1S  : BCSCTL3_LFXT1S_Field := MSP430_SVD.SYSTEM_CLOCK.Lfxt1S_0;
      --  Mode 0 for XT2
      XT2S    : BCSCTL3_XT2S_Field := MSP430_SVD.SYSTEM_CLOCK.Xt2S_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for BCSCTL3_Register use record
      LFXT1OF at 0 range 0 .. 0;
      XT2OF   at 0 range 1 .. 1;
      XCAP    at 0 range 2 .. 3;
      LFXT1S  at 0 range 4 .. 5;
      XT2S    at 0 range 6 .. 7;
   end record;

   --  DCOCTL_MOD array
   type DCOCTL_MOD_Field_Array is array (0 .. 4) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 5;

   --  Type definition for DCOCTL_MOD
   type DCOCTL_MOD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MOD as a value
            Val : MSP430_SVD.UInt5;
         when True =>
            --  MOD as an array
            Arr : DCOCTL_MOD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for DCOCTL_MOD_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  DCOCTL_DCO array
   type DCOCTL_DCO_Field_Array is array (0 .. 2) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 3;

   --  Type definition for DCOCTL_DCO
   type DCOCTL_DCO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DCO as a value
            Val : MSP430_SVD.UInt3;
         when True =>
            --  DCO as an array
            Arr : DCOCTL_DCO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for DCOCTL_DCO_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  DCO Clock Frequency Control
   type DCOCTL_Register is record
      --  Modulation Bit 0
      MOD_k : DCOCTL_MOD_Field := (As_Array => False, Val => 16#0#);
      --  DCO Select Bit 0
      DCO   : DCOCTL_DCO_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for DCOCTL_Register use record
      MOD_k at 0 range 0 .. 4;
      DCO   at 0 range 5 .. 7;
   end record;

   --  BCSCTL1_RSEL array
   type BCSCTL1_RSEL_Field_Array is array (0 .. 3) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 4;

   --  Type definition for BCSCTL1_RSEL
   type BCSCTL1_RSEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RSEL as a value
            Val : MSP430_SVD.UInt4;
         when True =>
            --  RSEL as an array
            Arr : BCSCTL1_RSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for BCSCTL1_RSEL_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  ACLK Divider 0
   type BCSCTL1_DIVA_Field is
     (--  ACLK Divider 0: /1
      Diva_0,
      --  ACLK Divider 1: /2
      Diva_1,
      --  ACLK Divider 2: /4
      Diva_2,
      --  ACLK Divider 3: /8
      Diva_3)
     with Size => 2;
   for BCSCTL1_DIVA_Field use
     (Diva_0 => 0,
      Diva_1 => 1,
      Diva_2 => 2,
      Diva_3 => 3);

   --  Basic Clock System Control 1
   type BCSCTL1_Register is record
      --  Range Select Bit 0
      RSEL   : BCSCTL1_RSEL_Field := (As_Array => False, Val => 16#0#);
      --  ACLK Divider 0
      DIVA   : BCSCTL1_DIVA_Field := MSP430_SVD.SYSTEM_CLOCK.Diva_0;
      --  LFXTCLK 0:Low Freq. / 1: High Freq.
      XTS    : MSP430_SVD.Bit := 16#0#;
      --  Enable XT2CLK
      XT2OFF : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for BCSCTL1_Register use record
      RSEL   at 0 range 0 .. 3;
      DIVA   at 0 range 4 .. 5;
      XTS    at 0 range 6 .. 6;
      XT2OFF at 0 range 7 .. 7;
   end record;

   --  SMCLK Divider 0
   type BCSCTL2_DIVS_Field is
     (--  SMCLK Divider 0: /1
      Divs_0,
      --  SMCLK Divider 1: /2
      Divs_1,
      --  SMCLK Divider 2: /4
      Divs_2,
      --  SMCLK Divider 3: /8
      Divs_3)
     with Size => 2;
   for BCSCTL2_DIVS_Field use
     (Divs_0 => 0,
      Divs_1 => 1,
      Divs_2 => 2,
      Divs_3 => 3);

   --  MCLK Divider 0
   type BCSCTL2_DIVM_Field is
     (--  MCLK Divider 0: /1
      Divm_0,
      --  MCLK Divider 1: /2
      Divm_1,
      --  MCLK Divider 2: /4
      Divm_2,
      --  MCLK Divider 3: /8
      Divm_3)
     with Size => 2;
   for BCSCTL2_DIVM_Field use
     (Divm_0 => 0,
      Divm_1 => 1,
      Divm_2 => 2,
      Divm_3 => 3);

   --  MCLK Source Select 0
   type BCSCTL2_SELM_Field is
     (--  MCLK Source Select 0: DCOCLK
      Selm_0,
      --  MCLK Source Select 1: DCOCLK
      Selm_1,
      --  MCLK Source Select 2: XT2CLK/LFXTCLK
      Selm_2,
      --  MCLK Source Select 3: LFXTCLK
      Selm_3)
     with Size => 2;
   for BCSCTL2_SELM_Field use
     (Selm_0 => 0,
      Selm_1 => 1,
      Selm_2 => 2,
      Selm_3 => 3);

   --  Basic Clock System Control 2
   type BCSCTL2_Register is record
      --  unspecified
      Reserved_0_0 : MSP430_SVD.Bit := 16#0#;
      --  SMCLK Divider 0
      DIVS         : BCSCTL2_DIVS_Field := MSP430_SVD.SYSTEM_CLOCK.Divs_0;
      --  SMCLK Source Select 0:DCOCLK / 1:XT2CLK/LFXTCLK
      SELS         : MSP430_SVD.Bit := 16#0#;
      --  MCLK Divider 0
      DIVM         : BCSCTL2_DIVM_Field := MSP430_SVD.SYSTEM_CLOCK.Divm_0;
      --  MCLK Source Select 0
      SELM         : BCSCTL2_SELM_Field := MSP430_SVD.SYSTEM_CLOCK.Selm_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for BCSCTL2_Register use record
      Reserved_0_0 at 0 range 0 .. 0;
      DIVS         at 0 range 1 .. 2;
      SELS         at 0 range 3 .. 3;
      DIVM         at 0 range 4 .. 5;
      SELM         at 0 range 6 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System Clock
   type SYSTEM_CLOCK_Peripheral is record
      --  Basic Clock System Control 3
      BCSCTL3 : aliased BCSCTL3_Register;
      --  DCO Clock Frequency Control
      DCOCTL  : aliased DCOCTL_Register;
      --  Basic Clock System Control 1
      BCSCTL1 : aliased BCSCTL1_Register;
      --  Basic Clock System Control 2
      BCSCTL2 : aliased BCSCTL2_Register;
   end record
     with Volatile;

   for SYSTEM_CLOCK_Peripheral use record
      BCSCTL3 at 16#1# range 0 .. 7;
      DCOCTL  at 16#4# range 0 .. 7;
      BCSCTL1 at 16#5# range 0 .. 7;
      BCSCTL2 at 16#6# range 0 .. 7;
   end record;

   --  System Clock
   SYSTEM_CLOCK_Periph : aliased SYSTEM_CLOCK_Peripheral
     with Import, Address => SYSTEM_CLOCK_Base;

end MSP430_SVD.SYSTEM_CLOCK;
