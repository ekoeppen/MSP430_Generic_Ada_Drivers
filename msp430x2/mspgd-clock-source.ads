generic

   Frequency : Unsigned_32;
   Source: Source_Type;
   Input: Input_Type;

package MSPGD.Clock.Source is

   pragma Preelaborate;

   procedure Init;
   procedure Delay_us (us : Natural);
   procedure Delay_ms (ms : Natural);
   procedure Delay_s (s : Natural);
   function Millisecond_Counter return Unsigned_32;
   procedure Delay_Slow_Periods (P : Unsigned_16);
   function Maximum_Delay_ms return Unsigned_16;

end MSPGD.Clock.Source;
