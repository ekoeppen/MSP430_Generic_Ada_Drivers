with Startup;
with MSPGD.GPIO; use MSPGD.GPIO;
with MSPGD.GPIO.Pin;
with MSPGD.UART.Peripheral;
with MSPGD.SPI.Peripheral;

package MSPGD.Board is

   pragma Preelaborate;

   package LED_RED is new MSPGD.GPIO.Pin (Port => 1, Pin => 0, Direction => Output);
   package LED_GREEN is new MSPGD.GPIO.Pin (Port => 2, Pin => 4, Direction => Output);
   package RX is new MSPGD.GPIO.Pin (Port => 1, Pin => 1, Alt_Func => Secondary);
   package TX is new MSPGD.GPIO.Pin (Port => 1, Pin => 2, Alt_Func => Secondary);
   package SCLK is new MSPGD.GPIO.Pin (Port => 1, Pin => 5, Alt_Func => Secondary);
   package MISO is new MSPGD.GPIO.Pin (Port => 1, Pin => 6, Alt_Func => Secondary);
   package MOSI is new MSPGD.GPIO.Pin (Port => 1, Pin => 7, Alt_Func => Secondary);
   package SSEL is new MSPGD.GPIO.Pin (Port => 2, Pin => 1, Direction => Output);
   package BUTTON is new MSPGD.GPIO.Pin (Port => 2, Pin => 3, Pull_Resistor => Up);
   package UART is new MSPGD.UART.Peripheral (Speed => 9600, Clock => 8_000_000);
   package SPI is new MSPGD.SPI.Peripheral (Module => MSPGD.SPI.USCI_B, Speed => 1_000_000, Clock => 1_000_000);

   procedure Init;

end MSPGD.Board;
