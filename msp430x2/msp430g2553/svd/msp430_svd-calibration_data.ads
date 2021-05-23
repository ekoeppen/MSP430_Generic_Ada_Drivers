--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Calibration Data
package MSP430_SVD.CALIBRATION_DATA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- Peripherals --
   -----------------

   --  Calibration Data
   type CALIBRATION_DATA_Peripheral is record
      --  DCOCTL Calibration Data for 16MHz
      CALDCO_16MHZ : aliased MSP430_SVD.Byte;
      --  BCSCTL1 Calibration Data for 16MHz
      CALBC1_16MHZ : aliased MSP430_SVD.Byte;
      --  DCOCTL Calibration Data for 12MHz
      CALDCO_12MHZ : aliased MSP430_SVD.Byte;
      --  BCSCTL1 Calibration Data for 12MHz
      CALBC1_12MHZ : aliased MSP430_SVD.Byte;
      --  DCOCTL Calibration Data for 8MHz
      CALDCO_8MHZ  : aliased MSP430_SVD.Byte;
      --  BCSCTL1 Calibration Data for 8MHz
      CALBC1_8MHZ  : aliased MSP430_SVD.Byte;
      --  DCOCTL Calibration Data for 1MHz
      CALDCO_1MHZ  : aliased MSP430_SVD.Byte;
      --  BCSCTL1 Calibration Data for 1MHz
      CALBC1_1MHZ  : aliased MSP430_SVD.Byte;
   end record
     with Volatile;

   for CALIBRATION_DATA_Peripheral use record
      CALDCO_16MHZ at 16#0# range 0 .. 7;
      CALBC1_16MHZ at 16#1# range 0 .. 7;
      CALDCO_12MHZ at 16#2# range 0 .. 7;
      CALBC1_12MHZ at 16#3# range 0 .. 7;
      CALDCO_8MHZ  at 16#4# range 0 .. 7;
      CALBC1_8MHZ  at 16#5# range 0 .. 7;
      CALDCO_1MHZ  at 16#6# range 0 .. 7;
      CALBC1_1MHZ  at 16#7# range 0 .. 7;
   end record;

   --  Calibration Data
   CALIBRATION_DATA_Periph : aliased CALIBRATION_DATA_Peripheral
     with Import, Address => CALIBRATION_DATA_Base;

end MSP430_SVD.CALIBRATION_DATA;
