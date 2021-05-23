with System;
with Startup;
with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.SYSTEM_CLOCK; use MSP430_SVD.SYSTEM_CLOCK;

package body MSPGD.Board is

   CALDCO_1MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FE#);
   CALBC1_1MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FF#);

   CALDCO_8MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FC#);
   CALBC1_8MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FD#);

   CALDCO_12MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FA#);
   CALBC1_12MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FB#);

   CALDCO_16MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10F8#);
   CALBC1_16MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10F9#);

   procedure Init is
   begin
      SYSTEM_CLOCK_Periph.DCOCTL.MOD_k.Val := 0;
      SYSTEM_CLOCK_Periph.DCOCTL.DCO.Val := 0;
      SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_8MHz;
      SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_8MHz;
      LED_RED.Init;
      LED_GREEN.Init;
      RX.Init;
      TX.Init;
      BUTTON.Init;
      UART.Init;
   end Init;

end MSPGD.Board;
