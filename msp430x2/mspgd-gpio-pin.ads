with MSPGD.GPIO; use MSPGD.GPIO;

generic

   Pin : Pin_Type;
   Port : Port_Type;
   Alt_Func : Alt_Func_Type := IO;
   Direction : Direction_Type := Input;
   Pull_Resistor : Resistor_Type := None;

package MSPGD.GPIO.Pin is

   pragma Preelaborate;

   procedure Init
      with Inline_Always;
   procedure Set
      with Inline_Always;
   procedure Clear
      with Inline_Always;
   function Is_Set return Boolean
      with Inline_Always;

end MSPGD.GPIO.Pin;
