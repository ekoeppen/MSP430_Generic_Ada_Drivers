--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Port 3/4
package MSP430_SVD.PORT_3_4 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  P3REN_P array
   type P3REN_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 3 Resistor Enable
   type P3REN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P3REN_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P3REN_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P3IN_P array
   type P3IN_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 3 Input
   type P3IN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P3IN_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P3IN_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P3OUT_P array
   type P3OUT_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 3 Output
   type P3OUT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P3OUT_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P3OUT_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P3DIR_P array
   type P3DIR_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 3 Direction
   type P3DIR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P3DIR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P3DIR_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P3SEL_P array
   type P3SEL_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 3 Selection
   type P3SEL_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P3SEL_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P3SEL_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Port 3/4
   type PORT_3_4_Peripheral is record
      --  Port 3 Resistor Enable
      P3REN  : aliased P3REN_Register;
      --  Port 3 Input
      P3IN   : aliased P3IN_Register;
      --  Port 3 Output
      P3OUT  : aliased P3OUT_Register;
      --  Port 3 Direction
      P3DIR  : aliased P3DIR_Register;
      --  Port 3 Selection
      P3SEL  : aliased P3SEL_Register;
      --  Port 3 Selection 2
      P3SEL2 : aliased P3SEL_Register;
   end record
     with Volatile;

   for PORT_3_4_Peripheral use record
      P3REN  at 16#0# range 0 .. 7;
      P3IN   at 16#8# range 0 .. 7;
      P3OUT  at 16#9# range 0 .. 7;
      P3DIR  at 16#A# range 0 .. 7;
      P3SEL  at 16#B# range 0 .. 7;
      P3SEL2 at 16#33# range 0 .. 7;
   end record;

   --  Port 3/4
   PORT_3_4_Periph : aliased PORT_3_4_Peripheral
     with Import, Address => PORT_3_4_Base;

end MSP430_SVD.PORT_3_4;
