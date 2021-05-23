with Interfaces;

generic

   Resistor_Value : Unsigned_32 := 10_000;
   NTC_Is_Upper : Boolean := True;
   Beta : Positive := 3976;
   V_In_Max : Unsigned_32 := 2 ** 10 - 1;

package Drivers.NTC is

   pragma Preelaborate;

   function Value (V : Positive) return Unsigned_32;
   function Temperature (V : Positive) return Integer;

end Drivers.NTC;
