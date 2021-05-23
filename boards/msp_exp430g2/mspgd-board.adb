with System;
with Startup;

package body MSPGD.Board is

   procedure Init is
   begin
      Clock.Init;
      LED_RED.Init;
      LED_GREEN.Init;
      RX.Init;
      TX.Init;
      BUTTON.Init;
      UART.Init;
   end Init;

end MSPGD.Board;
