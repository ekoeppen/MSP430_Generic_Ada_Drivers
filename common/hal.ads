with MSPGD.GPIO.Pin;
with MSPGD.GPIO.Polled;
with MSPGD.Clock.Source;
with MSPGD.UART.Peripheral;
with MSPGD.SPI.Peripheral;

package HAL is

   pragma Preelaborate;

   generic package Pin     renames MSPGD.GPIO.Pin;
   generic package Pin_IRQ renames MSPGD.GPIO.Polled;
   generic package USART   renames MSPGD.UART.Peripheral;
   generic package SPI     renames MSPGD.SPI.Peripheral;
   generic package Clock   renames MSPGD.Clock.Source;

end HAL;
