with Interfaces; use Interfaces;
with MSPGD;
with MSPGD.Board; use MSPGD.Board;
with MSPGD.SPI;
with Drivers.Text_IO;

procedure Main is

   pragma Preelaborate;

   package Text_IO is new Drivers.Text_IO (USART => MSPGD.Board.UART);
   Buffer : MSPGD.Buffer_Type (0 .. 15);

begin
   Init;
   LED_RED.Init;
   SPI.Init;
   SCLK.Init;
   MISO.Init;
   MOSI.Init;
   SSEL.Init;
   SSEL.Set;
   Text_IO.Put_Line ("Hello, World!");
   loop
      if not BUTTON.Is_Set then
         for I in Buffer'Range loop Buffer (I) := Unsigned_8 (I + 32); end loop;
         LED_RED.Set;
         SSEL.Clear;
         SPI.Transfer (Buffer);
         SSEL.Set;
         LED_RED.Clear;
      end if;
   end loop;

end Main;
