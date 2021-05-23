--  This spec has been automatically generated from out.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Watchdog Timer
package MSP430_SVD.WATCHDOG_TIMER is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  WDTCTL_WDTIS array
   type WDTCTL_WDTIS_Field_Array is array (0 .. 1) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 2;

   --  Type definition for WDTCTL_WDTIS
   type WDTCTL_WDTIS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WDTIS as a value
            Val : MSP430_SVD.UInt2;
         when True =>
            --  WDTIS as an array
            Arr : WDTCTL_WDTIS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WDTCTL_WDTIS_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Watchdog Timer Control
   type WDTCTL_Register is record
      --  WDTIS0
      WDTIS         : WDTCTL_WDTIS_Field := (As_Array => False, Val => 16#0#);
      --  WDTSSEL
      WDTSSEL       : MSP430_SVD.Bit := 16#0#;
      --  WDTCNTCL
      WDTCNTCL      : MSP430_SVD.Bit := 16#0#;
      --  WDTTMSEL
      WDTTMSEL      : MSP430_SVD.Bit := 16#0#;
      --  WDTNMI
      WDTNMI        : MSP430_SVD.Bit := 16#0#;
      --  WDTNMIES
      WDTNMIES      : MSP430_SVD.Bit := 16#0#;
      --  WDTHOLD
      WDTHOLD       : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_8_15 : MSP430_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for WDTCTL_Register use record
      WDTIS         at 0 range 0 .. 1;
      WDTSSEL       at 0 range 2 .. 2;
      WDTCNTCL      at 0 range 3 .. 3;
      WDTTMSEL      at 0 range 4 .. 4;
      WDTNMI        at 0 range 5 .. 5;
      WDTNMIES      at 0 range 6 .. 6;
      WDTHOLD       at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Watchdog Timer
   type WATCHDOG_TIMER_Peripheral is record
      --  Watchdog Timer Control
      WDTCTL : aliased WDTCTL_Register;
   end record
     with Volatile;

   for WATCHDOG_TIMER_Peripheral use record
      WDTCTL at 0 range 0 .. 15;
   end record;

   --  Watchdog Timer
   WATCHDOG_TIMER_Periph : aliased WATCHDOG_TIMER_Peripheral
     with Import, Address => WATCHDOG_TIMER_Base;

end MSP430_SVD.WATCHDOG_TIMER;
