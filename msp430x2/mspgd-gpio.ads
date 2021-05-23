with MSPGD;

package MSPGD.GPIO is

   pragma Preelaborate;

   type Alt_Func_Type is (IO, Primary, Secondary, Device_Specific, Analog, Comparator);
   type Direction_Type is (Input, Output);
   type Resistor_Type is (None, Up, Down);
   subtype Pin_Type is Integer range 0 .. 7;
   subtype Port_Type is Unsigned_8 range 1 .. 8;

end MSPGD.GPIO;
