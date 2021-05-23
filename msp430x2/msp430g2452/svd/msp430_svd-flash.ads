--  This spec has been automatically generated from out.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Flash
package MSP430_SVD.FLASH is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  FLASH Control 1
   type FCTL1_Register is record
      --  unspecified
      Reserved_0_0  : MSP430_SVD.Bit := 16#0#;
      --  Enable bit for Flash segment erase
      ERASE         : MSP430_SVD.Bit := 16#0#;
      --  Enable bit for Flash mass erase
      MERAS         : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_3_5  : MSP430_SVD.UInt3 := 16#0#;
      --  Enable bit for Flash write
      WRT           : MSP430_SVD.Bit := 16#0#;
      --  Enable bit for Flash segment write
      BLKWRT        : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_8_15 : MSP430_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for FCTL1_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      ERASE         at 0 range 1 .. 1;
      MERAS         at 0 range 2 .. 2;
      Reserved_3_5  at 0 range 3 .. 5;
      WRT           at 0 range 6 .. 6;
      BLKWRT        at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  FCTL2_FN array
   type FCTL2_FN_Field_Array is array (0 .. 5) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 6;

   --  Type definition for FCTL2_FN
   type FCTL2_FN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FN as a value
            Val : MSP430_SVD.UInt6;
         when True =>
            --  FN as an array
            Arr : FCTL2_FN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for FCTL2_FN_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  Flash clock select 0 */ /* to distinguish from USART SSELx
   type FCTL2_FSSEL_Field is
     (--  Flash clock select: 0 - ACLK
      Fssel_0,
      --  Flash clock select: 1 - MCLK
      Fssel_1,
      --  Flash clock select: 2 - SMCLK
      Fssel_2,
      --  Flash clock select: 3 - SMCLK
      Fssel_3)
     with Size => 2;
   for FCTL2_FSSEL_Field use
     (Fssel_0 => 0,
      Fssel_1 => 1,
      Fssel_2 => 2,
      Fssel_3 => 3);

   --  FLASH Control 2
   type FCTL2_Register is record
      --  Divide Flash clock by 1 to 64 using FN0 to FN5 according to:
      FN            : FCTL2_FN_Field := (As_Array => False, Val => 16#0#);
      --  Flash clock select 0 */ /* to distinguish from USART SSELx
      FSSEL         : FCTL2_FSSEL_Field := MSP430_SVD.FLASH.Fssel_0;
      --  unspecified
      Reserved_8_15 : MSP430_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for FCTL2_Register use record
      FN            at 0 range 0 .. 5;
      FSSEL         at 0 range 6 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  FLASH Control 3
   type FCTL3_Register is record
      --  Flash busy: 1
      BUSY          : MSP430_SVD.Bit := 16#0#;
      --  Flash Key violation flag
      KEYV          : MSP430_SVD.Bit := 16#0#;
      --  Flash Access violation flag
      ACCVIFG       : MSP430_SVD.Bit := 16#0#;
      --  Wait flag for segment write
      WAIT          : MSP430_SVD.Bit := 16#0#;
      --  Lock bit: 1 - Flash is locked (read only)
      LOCK          : MSP430_SVD.Bit := 16#0#;
      --  Flash Emergency Exit
      EMEX          : MSP430_SVD.Bit := 16#0#;
      --  Segment A Lock bit: read = 1 - Segment is locked (read only)
      LOCKA         : MSP430_SVD.Bit := 16#0#;
      --  Last Program or Erase failed
      FAIL          : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_8_15 : MSP430_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for FCTL3_Register use record
      BUSY          at 0 range 0 .. 0;
      KEYV          at 0 range 1 .. 1;
      ACCVIFG       at 0 range 2 .. 2;
      WAIT          at 0 range 3 .. 3;
      LOCK          at 0 range 4 .. 4;
      EMEX          at 0 range 5 .. 5;
      LOCKA         at 0 range 6 .. 6;
      FAIL          at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Flash
   type FLASH_Peripheral is record
      --  FLASH Control 1
      FCTL1 : aliased FCTL1_Register;
      --  FLASH Control 2
      FCTL2 : aliased FCTL2_Register;
      --  FLASH Control 3
      FCTL3 : aliased FCTL3_Register;
   end record
     with Volatile;

   for FLASH_Peripheral use record
      FCTL1 at 16#0# range 0 .. 15;
      FCTL2 at 16#2# range 0 .. 15;
      FCTL3 at 16#4# range 0 .. 15;
   end record;

   --  Flash
   FLASH_Periph : aliased FLASH_Peripheral
     with Import, Address => FLASH_Base;

end MSP430_SVD.FLASH;
