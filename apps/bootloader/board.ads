with MSPGD.UART.Peripheral;
with MSPGD.Clock; use MSPGD.Clock;
with MSPGD.Clock.Source;

package Board is

   pragma Preelaborate;

   package Clock is new MSPGD.Clock.Source (Source => SMCLK, Input => DCO, Frequency => 8_000_000);
   package UART is new MSPGD.UART.Peripheral (Speed => 9600, Clock => Clock);

   procedure Init;

end Board;
