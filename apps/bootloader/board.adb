with System.Storage_Elements; use System.Storage_Elements;
with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.SYSTEM_CLOCK; use MSP430_SVD.SYSTEM_CLOCK;
with MSPGD.GPIO; use MSPGD.GPIO;
with MSPGD.GPIO.Pin;
with Startup;

package body Board is

   CALDCO_1MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FE#);
   CALBC1_1MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FF#);

   CALDCO_8MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FC#);
   CALBC1_8MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FD#);

   package RX is new MSPGD.GPIO.Pin (Port => 1, Pin => 1, Alt_Func => Secondary);
   package TX is new MSPGD.GPIO.Pin (Port => 1, Pin => 2, Alt_Func => Secondary);

   procedure Init is
   begin
      --  SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_8MHz;
      --  SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_8MHz;
      Clock.Init;
      RX.Init;
      TX.Init;
      UART.Init;
   end Init;

end Board;
