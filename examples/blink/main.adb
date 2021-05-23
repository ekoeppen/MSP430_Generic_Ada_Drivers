with MSPGD.Board; use MSPGD.Board;
with MSPGD.Clock; use MSPGD.Clock;
with MSPGD.Clock.Source;

procedure Main is

   pragma Preelaborate;
   package Delay_Clock is new MSPGD.Clock.Source (Frequency => 1500, Input => VLO, Source => ACLK);

begin
   Init;
   Delay_Clock.Init;
   loop
      LED_RED.Set;
      Delay_Clock.Delay_Slow_Periods (1);
      --  Delay_Clock.Delay_s (3);
      LED_RED.Clear;
      Delay_Clock.Delay_Slow_Periods (1);
      --  Delay_Clock.Delay_s (3);
   end loop;

end Main;
