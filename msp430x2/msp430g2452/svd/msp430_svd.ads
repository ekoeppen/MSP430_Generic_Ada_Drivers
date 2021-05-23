--  This spec has been automatically generated from out.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces;  use Interfaces;
with System;

package MSP430_SVD is
   pragma Preelaborate;

   ---------------
   -- Base type --
   ---------------

   type UInt32 is new Interfaces.Unsigned_32;
   type UInt16 is new Interfaces.Unsigned_16;
   type Byte is new Interfaces.Unsigned_8;
   type Bit is mod 2**1
     with Size => 1;

   --------------------
   -- Base addresses --
   --------------------

   SPECIAL_FUNCTION_Base : constant System.Address := System'To_Address (16#0#);
   PORT_1_2_Base : constant System.Address := System'To_Address (16#20#);
   ADC10_Base : constant System.Address := System'To_Address (16#48#);
   SYSTEM_CLOCK_Base : constant System.Address := System'To_Address (16#52#);
   COMPARATOR_A_Base : constant System.Address := System'To_Address (16#58#);
   USI_Base : constant System.Address := System'To_Address (16#78#);
   TLV_CALIBRATION_DATA_Base : constant System.Address := System'To_Address (16#10C0#);
   CALIBRATION_DATA_Base : constant System.Address := System'To_Address (16#10F8#);
   WATCHDOG_TIMER_Base : constant System.Address := System'To_Address (16#120#);
   FLASH_Base : constant System.Address := System'To_Address (16#128#);
   TIMER_0_A3_Base : constant System.Address := System'To_Address (16#12E#);
   INTERRUPTS_Base : constant System.Address := System'To_Address (16#FFE0#);

end MSP430_SVD;
