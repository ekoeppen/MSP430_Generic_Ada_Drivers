--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package MSP430_SVD.INTERRUPTS is
   pragma Preelaborate;

   -----------------
   -- Peripherals --
   -----------------

   type INTERRUPTS_Peripheral is record
   end record
     with Volatile;

   for INTERRUPTS_Peripheral use record
   end record;

   INTERRUPTS_Periph : aliased _INTERRUPTS_Peripheral
     with Import, Address => _INTERRUPTS_Base;

end MSP430_SVD.INTERRUPTS;
