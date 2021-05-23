--  This spec has been automatically generated from out.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  TLV Calibration Data
package MSP430_SVD.TLV_CALIBRATION_DATA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- Peripherals --
   -----------------

   --  TLV Calibration Data
   type TLV_CALIBRATION_DATA_Peripheral is record
      --  TLV CHECK SUM
      TLV_CHECKSUM    : aliased MSP430_SVD.UInt16;
      --  TLV ADC10_1 TAG
      TLV_ADC10_1_TAG : aliased MSP430_SVD.Byte;
      --  TLV ADC10_1 LEN
      TLV_ADC10_1_LEN : aliased MSP430_SVD.Byte;
      --  TLV TAG_DCO30 TAG
      TLV_DCO_30_TAG  : aliased MSP430_SVD.Byte;
      --  TLV TAG_DCO30 LEN
      TLV_DCO_30_LEN  : aliased MSP430_SVD.Byte;
   end record
     with Volatile;

   for TLV_CALIBRATION_DATA_Peripheral use record
      TLV_CHECKSUM    at 16#0# range 0 .. 15;
      TLV_ADC10_1_TAG at 16#1A# range 0 .. 7;
      TLV_ADC10_1_LEN at 16#1B# range 0 .. 7;
      TLV_DCO_30_TAG  at 16#36# range 0 .. 7;
      TLV_DCO_30_LEN  at 16#37# range 0 .. 7;
   end record;

   --  TLV Calibration Data
   TLV_CALIBRATION_DATA_Periph : aliased TLV_CALIBRATION_DATA_Peripheral
     with Import, Address => TLV_CALIBRATION_DATA_Base;

end MSP430_SVD.TLV_CALIBRATION_DATA;
