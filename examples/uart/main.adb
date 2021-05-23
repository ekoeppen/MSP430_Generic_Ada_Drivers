with Interfaces; use Interfaces;
with MSPGD.Board;
with Drivers.Text_IO;

procedure Main is

   pragma Preelaborate;

   package Board renames MSPGD.Board;
   package Text_IO is new Drivers.Text_IO (USART => Board.UART);

   N : Unsigned_32 := 0;

begin
   Board.Init;
   Text_IO.Put_Line ("Hello, World!");
   loop
      if not Board.BUTTON.Is_Set then
         Board.LED_GREEN.Set;
         Text_IO.Put_Hex (N, 8); Text_IO.New_Line;
         Board.LED_GREEN.Clear;
         N := N + 1;
      end if;
   end loop;

end Main;
