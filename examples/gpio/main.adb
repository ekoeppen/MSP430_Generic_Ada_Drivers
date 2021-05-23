with MSPGD.Board; use MSPGD.Board;

procedure Main is

   pragma Preelaborate;

begin
   Init;
   loop
      if BUTTON.Is_Set then LED_GREEN.Set; else LED_GREEN.Clear; end if;
   end loop;

end Main;
