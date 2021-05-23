--  This spec has been automatically generated from out.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Port 1/2
package MSP430_SVD.PORT_1_2 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  P1IN_P array
   type P1IN_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Input
   type P1IN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1IN_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1IN_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1OUT_P array
   type P1OUT_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Output
   type P1OUT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1OUT_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1OUT_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1DIR_P array
   type P1DIR_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Direction
   type P1DIR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1DIR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1DIR_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1IFG_P array
   type P1IFG_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Interrupt Flag
   type P1IFG_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1IFG_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1IFG_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1IES_P array
   type P1IES_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Interrupt Edge Select
   type P1IES_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1IES_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1IES_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1IE_P array
   type P1IE_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Interrupt Enable
   type P1IE_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1IE_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1IE_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1SEL_P array
   type P1SEL_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Selection
   type P1SEL_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1SEL_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1SEL_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P1REN_P array
   type P1REN_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 1 Resistor Enable
   type P1REN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P1REN_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P1REN_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2IN_P array
   type P2IN_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Input
   type P2IN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2IN_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2IN_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2OUT_P array
   type P2OUT_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Output
   type P2OUT_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2OUT_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2OUT_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2DIR_P array
   type P2DIR_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Direction
   type P2DIR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2DIR_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2DIR_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2IFG_P array
   type P2IFG_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Interrupt Flag
   type P2IFG_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2IFG_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2IFG_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2IES_P array
   type P2IES_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Interrupt Edge Select
   type P2IES_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2IES_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2IES_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2IE_P array
   type P2IE_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Interrupt Enable
   type P2IE_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2IE_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2IE_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2SEL_P array
   type P2SEL_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Selection
   type P2SEL_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2SEL_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2SEL_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  P2REN_P array
   type P2REN_P_Field_Array is array (0 .. 7) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 8;

   --  Port 2 Resistor Enable
   type P2REN_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  P as a value
            Val : MSP430_SVD.Byte;
         when True =>
            --  P as an array
            Arr : P2REN_P_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8, Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for P2REN_Register use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Port 1/2
   type PORT_1_2_Peripheral is record
      --  Port 1 Input
      P1IN   : aliased P1IN_Register;
      --  Port 1 Output
      P1OUT  : aliased P1OUT_Register;
      --  Port 1 Direction
      P1DIR  : aliased P1DIR_Register;
      --  Port 1 Interrupt Flag
      P1IFG  : aliased P1IFG_Register;
      --  Port 1 Interrupt Edge Select
      P1IES  : aliased P1IES_Register;
      --  Port 1 Interrupt Enable
      P1IE   : aliased P1IE_Register;
      --  Port 1 Selection
      P1SEL  : aliased P1SEL_Register;
      --  Port 1 Resistor Enable
      P1REN  : aliased P1REN_Register;
      --  Port 2 Input
      P2IN   : aliased P2IN_Register;
      --  Port 2 Output
      P2OUT  : aliased P2OUT_Register;
      --  Port 2 Direction
      P2DIR  : aliased P2DIR_Register;
      --  Port 2 Interrupt Flag
      P2IFG  : aliased P2IFG_Register;
      --  Port 2 Interrupt Edge Select
      P2IES  : aliased P2IES_Register;
      --  Port 2 Interrupt Enable
      P2IE   : aliased P2IE_Register;
      --  Port 2 Selection
      P2SEL  : aliased P2SEL_Register;
      --  Port 2 Resistor Enable
      P2REN  : aliased P2REN_Register;
      --  Port 1 Selection 2
      P1SEL2 : aliased P1SEL_Register;
      --  Port 2 Selection 2
      P2SEL2 : aliased P2SEL_Register;
   end record
     with Volatile;

   for PORT_1_2_Peripheral use record
      P1IN   at 16#0# range 0 .. 7;
      P1OUT  at 16#1# range 0 .. 7;
      P1DIR  at 16#2# range 0 .. 7;
      P1IFG  at 16#3# range 0 .. 7;
      P1IES  at 16#4# range 0 .. 7;
      P1IE   at 16#5# range 0 .. 7;
      P1SEL  at 16#6# range 0 .. 7;
      P1REN  at 16#7# range 0 .. 7;
      P2IN   at 16#8# range 0 .. 7;
      P2OUT  at 16#9# range 0 .. 7;
      P2DIR  at 16#A# range 0 .. 7;
      P2IFG  at 16#B# range 0 .. 7;
      P2IES  at 16#C# range 0 .. 7;
      P2IE   at 16#D# range 0 .. 7;
      P2SEL  at 16#E# range 0 .. 7;
      P2REN  at 16#F# range 0 .. 7;
      P1SEL2 at 16#21# range 0 .. 7;
      P2SEL2 at 16#22# range 0 .. 7;
   end record;

   --  Port 1/2
   PORT_1_2_Periph : aliased PORT_1_2_Peripheral
     with Import, Address => PORT_1_2_Base;

end MSP430_SVD.PORT_1_2;
