package body Drivers.NTC is

   function Value (V : Positive) return Unsigned_32 is
      NTC_R : Unsigned_32;
   begin
      if NTC_Is_Upper then
         NTC_R := V_In_Max * Resistor_Value / Unsigned_32 (V) - Resistor_Value;
      else
         NTC_R := Unsigned_32 (V) / (V_In_Max - Unsigned_32 (V)) * Resistor_Value;
      end if;
      return NTC_R;
   end Value;

   function Temperature (V : Positive) return Integer is
   begin
      return 0;
   end Temperature;

end Drivers.NTC;
