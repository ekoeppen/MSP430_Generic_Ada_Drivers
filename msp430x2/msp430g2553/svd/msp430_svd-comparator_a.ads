--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Comparator A
package MSP430_SVD.COMPARATOR_A is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Comp. A Internal Reference Select 0
   type CACTL1_CAREF_Field is
     (--  Comp. A Int. Ref. Select 0 : Off
      Caref_0,
      --  Comp. A Int. Ref. Select 1 : 0.25*Vcc
      Caref_1,
      --  Comp. A Int. Ref. Select 2 : 0.5*Vcc
      Caref_2,
      --  Comp. A Int. Ref. Select 3 : Vt
      Caref_3)
     with Size => 2;
   for CACTL1_CAREF_Field use
     (Caref_0 => 0,
      Caref_1 => 1,
      Caref_2 => 2,
      Caref_3 => 3);

   --  Comparator A Control 1
   type CACTL1_Register is record
      --  Comp. A Interrupt Flag
      CAIFG  : MSP430_SVD.Bit := 16#0#;
      --  Comp. A Interrupt Enable
      CAIE   : MSP430_SVD.Bit := 16#0#;
      --  Comp. A Int. Edge Select: 0:rising / 1:falling
      CAIES  : MSP430_SVD.Bit := 16#0#;
      --  Comp. A enable
      CAON   : MSP430_SVD.Bit := 16#0#;
      --  Comp. A Internal Reference Select 0
      CAREF  : CACTL1_CAREF_Field := MSP430_SVD.COMPARATOR_A.Caref_0;
      --  Comp. A Internal Reference Enable
      CARSEL : MSP430_SVD.Bit := 16#0#;
      --  Comp. A Exchange Inputs
      CAEX   : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for CACTL1_Register use record
      CAIFG  at 0 range 0 .. 0;
      CAIE   at 0 range 1 .. 1;
      CAIES  at 0 range 2 .. 2;
      CAON   at 0 range 3 .. 3;
      CAREF  at 0 range 4 .. 5;
      CARSEL at 0 range 6 .. 6;
      CAEX   at 0 range 7 .. 7;
   end record;

   --  CACTL2_P2CA array
   type CACTL2_P2CA_Field_Array is array (0 .. 4) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 5;

   --  Type definition for CACTL2_P2CA
   type CACTL2_P2CA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P2CA as a value
            Val : MSP430_SVD.UInt5;
         when True =>
            --  P2CA as an array
            Arr : CACTL2_P2CA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CACTL2_P2CA_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Comparator A Control 2
   type CACTL2_Register is record
      --  Comp. A Output
      CAOUT   : MSP430_SVD.Bit := 16#0#;
      --  Comp. A Enable Output Filter
      CAF     : MSP430_SVD.Bit := 16#0#;
      --  Comp. A +Terminal Multiplexer
      P2CA    : CACTL2_P2CA_Field := (As_Array => False, Val => 16#0#);
      --  Comp. A Short + and - Terminals
      CASHORT : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for CACTL2_Register use record
      CAOUT   at 0 range 0 .. 0;
      CAF     at 0 range 1 .. 1;
      P2CA    at 0 range 2 .. 6;
      CASHORT at 0 range 7 .. 7;
   end record;

   --  CAPD array
   type CAPD_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Comparator A Port Disable
   type CAPD_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CAPD as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  CAPD as an array
            Arr : CAPD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for CAPD_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Comparator A
   type COMPARATOR_A_Peripheral is record
      --  Comparator A Control 1
      CACTL1 : aliased CACTL1_Register;
      --  Comparator A Control 2
      CACTL2 : aliased CACTL2_Register;
      --  Comparator A Port Disable
      CAPD   : aliased CAPD_Register;
   end record
     with Volatile;

   for COMPARATOR_A_Peripheral use record
      CACTL1 at 16#1# range 0 .. 7;
      CACTL2 at 16#2# range 0 .. 7;
      CAPD   at 16#3# range 0 .. 7;
   end record;

   --  Comparator A
   COMPARATOR_A_Periph : aliased COMPARATOR_A_Peripheral
     with Import, Address => COMPARATOR_A_Base;

end MSP430_SVD.COMPARATOR_A;
