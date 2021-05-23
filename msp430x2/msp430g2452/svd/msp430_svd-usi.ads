--  This spec has been automatically generated from out.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  USI
package MSP430_SVD.USI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  USICTL0_USIPE array
   type USICTL0_USIPE_Field_Array is array (5 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 3;

   --  Type definition for USICTL0_USIPE
   type USICTL0_USIPE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USIPE as a value
            Val : MSP430_SVD.UInt3;
         when True =>
            --  USIPE as an array
            Arr : USICTL0_USIPE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for USICTL0_USIPE_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  USI Control Register 0
   type USICTL0_Register is record
      --  USI Software Reset
      USISWRST : MSP430_SVD.Bit := 16#0#;
      --  USI Output Enable
      USIOE    : MSP430_SVD.Bit := 16#0#;
      --  USI General Output Enable Latch
      USIGE    : MSP430_SVD.Bit := 16#0#;
      --  USI Master Select 0:Slave / 1:Master
      USIMST   : MSP430_SVD.Bit := 16#0#;
      --  USI LSB first 1:LSB / 0:MSB
      USILSB   : MSP430_SVD.Bit := 16#0#;
      --  USI Port Enable Px.5
      USIPE    : USICTL0_USIPE_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USICTL0_Register use record
      USISWRST at 0 range 0 .. 0;
      USIOE    at 0 range 1 .. 1;
      USIGE    at 0 range 2 .. 2;
      USIMST   at 0 range 3 .. 3;
      USILSB   at 0 range 4 .. 4;
      USIPE    at 0 range 5 .. 7;
   end record;

   --  USI Control Register 1
   type USICTL1_Register is record
      --  USI Counter Interrupt Flag
      USIIFG    : MSP430_SVD.Bit := 16#0#;
      --  USI START Condition interrupt Flag
      USISTTIFG : MSP430_SVD.Bit := 16#0#;
      --  USI STOP Condition received
      USISTP    : MSP430_SVD.Bit := 16#0#;
      --  USI Arbitration Lost
      USIAL     : MSP430_SVD.Bit := 16#0#;
      --  USI Counter Interrupt enable
      USIIE     : MSP430_SVD.Bit := 16#0#;
      --  USI START Condition interrupt enable
      USISTTIE  : MSP430_SVD.Bit := 16#0#;
      --  USI I2C Mode
      USII2C    : MSP430_SVD.Bit := 16#0#;
      --  USI Sync. Mode: Clock Phase
      USICKPH   : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USICTL1_Register use record
      USIIFG    at 0 range 0 .. 0;
      USISTTIFG at 0 range 1 .. 1;
      USISTP    at 0 range 2 .. 2;
      USIAL     at 0 range 3 .. 3;
      USIIE     at 0 range 4 .. 4;
      USISTTIE  at 0 range 5 .. 5;
      USII2C    at 0 range 6 .. 6;
      USICKPH   at 0 range 7 .. 7;
   end record;

   --  USI Clock Source Select 2
   type USICKCTL_USISSEL_Field is
     (--  USI Clock Source: 0
      Usissel_0,
      --  USI Clock Source: 1
      Usissel_1,
      --  USI Clock Source: 2
      Usissel_2,
      --  USI Clock Source: 3
      Usissel_3,
      --  USI Clock Source: 4
      Usissel_4,
      --  USI Clock Source: 5
      Usissel_5,
      --  USI Clock Source: 6
      Usissel_6,
      --  USI Clock Source: 7
      Usissel_7)
     with Size => 3;
   for USICKCTL_USISSEL_Field use
     (Usissel_0 => 0,
      Usissel_1 => 1,
      Usissel_2 => 2,
      Usissel_3 => 3,
      Usissel_4 => 4,
      Usissel_5 => 5,
      Usissel_6 => 6,
      Usissel_7 => 7);

   --  USI Clock Divider 2
   type USICKCTL_USIDIV_Field is
     (--  USI Clock Divider: 0
      Usidiv_0,
      --  USI Clock Divider: 1
      Usidiv_1,
      --  USI Clock Divider: 2
      Usidiv_2,
      --  USI Clock Divider: 3
      Usidiv_3,
      --  USI Clock Divider: 4
      Usidiv_4,
      --  USI Clock Divider: 5
      Usidiv_5,
      --  USI Clock Divider: 6
      Usidiv_6,
      --  USI Clock Divider: 7
      Usidiv_7)
     with Size => 3;
   for USICKCTL_USIDIV_Field use
     (Usidiv_0 => 0,
      Usidiv_1 => 1,
      Usidiv_2 => 2,
      Usidiv_3 => 3,
      Usidiv_4 => 4,
      Usidiv_5 => 5,
      Usidiv_6 => 6,
      Usidiv_7 => 7);

   --  USI Clock Control Register
   type USICKCTL_Register is record
      --  USI Software Clock
      USISWCLK : MSP430_SVD.Bit := 16#0#;
      --  USI Clock Polarity 0:Inactive=Low / 1:Inactive=High
      USICKPL  : MSP430_SVD.Bit := 16#0#;
      --  USI Clock Source Select 2
      USISSEL  : USICKCTL_USISSEL_Field := MSP430_SVD.USI.Usissel_0;
      --  USI Clock Divider 2
      USIDIV   : USICKCTL_USIDIV_Field := MSP430_SVD.USI.Usidiv_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USICKCTL_Register use record
      USISWCLK at 0 range 0 .. 0;
      USICKPL  at 0 range 1 .. 1;
      USISSEL  at 0 range 2 .. 4;
      USIDIV   at 0 range 5 .. 7;
   end record;

   --  USICNT array
   type USICNT_Field_Array is array (0 .. 4) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 5;

   --  Type definition for USICNT
   type USICNT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USICNT as a value
            Val : MSP430_SVD.UInt5;
         when True =>
            --  USICNT as an array
            Arr : USICNT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for USICNT_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  USI Bit Counter Register
   type USICNT_Register is record
      --  USI Bit Count 0
      USICNT    : USICNT_Field := (As_Array => False, Val => 16#0#);
      --  USI Interrupt Flag Clear Control
      USIIFGCC  : MSP430_SVD.Bit := 16#0#;
      --  USI 16 Bit Shift Register Enable
      USI16B    : MSP430_SVD.Bit := 16#0#;
      --  USI SCL Released
      USISCLREL : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for USICNT_Register use record
      USICNT    at 0 range 0 .. 4;
      USIIFGCC  at 0 range 5 .. 5;
      USI16B    at 0 range 6 .. 6;
      USISCLREL at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USI
   type USI_Peripheral is record
      --  USI Control Register 0
      USICTL0  : aliased USICTL0_Register;
      --  USI Control Register 1
      USICTL1  : aliased USICTL1_Register;
      --  USI Clock Control Register
      USICKCTL : aliased USICKCTL_Register;
      --  USI Bit Counter Register
      USICNT   : aliased USICNT_Register;
      --  USI Low Byte Shift Register
      USISRL   : aliased MSP430_SVD.Byte;
      --  USI High Byte Shift Register
      USISRH   : aliased MSP430_SVD.Byte;
   end record
     with Volatile;

   for USI_Peripheral use record
      USICTL0  at 16#0# range 0 .. 7;
      USICTL1  at 16#1# range 0 .. 7;
      USICKCTL at 16#2# range 0 .. 7;
      USICNT   at 16#3# range 0 .. 7;
      USISRL   at 16#4# range 0 .. 7;
      USISRH   at 16#5# range 0 .. 7;
   end record;

   --  USI
   USI_Periph : aliased USI_Peripheral
     with Import, Address => USI_Base;

end MSP430_SVD.USI;
