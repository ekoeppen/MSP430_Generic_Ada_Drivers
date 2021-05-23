with MSP430_SVD.USCI_A0_UART_MODE; use MSP430_SVD.USCI_A0_UART_MODE;
with MSP430_SVD.SPECIAL_FUNCTION; use MSP430_SVD.SPECIAL_FUNCTION;

package body MSPGD.UART.Peripheral is

   procedure Init is
      Baud_Rate_Div : constant UInt32 := UInt32 (Clock.Frequency) / Speed;
   begin
      USCI_A0_UART_MODE_Periph.UCA0CTL1.UCSWRST := 1;
      case Clock.Source is
         when MSPGD.Clock.ACLK => USCI_A0_UART_MODE_Periph.UCA0CTL1.UCSSEL := UCSSEL_1;
         when MSPGD.Clock.SMCLK => USCI_A0_UART_MODE_Periph.UCA0CTL1.UCSSEL := UCSSEL_2;
         when others => null;
      end case;
      USCI_A0_UART_MODE_Periph.UCA0BR0 := Byte (Baud_Rate_Div mod 256);
      USCI_A0_UART_MODE_Periph.UCA0BR1 := Byte ((Baud_Rate_Div / 256) mod 256);
      USCI_A0_UART_MODE_Periph.UCA0MCTL.UCBRF := UCBRF_5;
      USCI_A0_UART_MODE_Periph.UCA0CTL1.UCSWRST := 0;
   end Init;

   procedure Transmit (Data : Byte) is
   begin
      while SPECIAL_FUNCTION_Periph.IFG2.UCA0TXIFG = 0 loop null; end loop;
      USCI_A0_UART_MODE_Periph.UCA0TXBUF := Data;
   end Transmit;

   function Receive return Byte is
   begin
      while SPECIAL_FUNCTION_Periph.IFG2.UCA0RXIFG = 0 loop null; end loop;
      return USCI_A0_UART_MODE_Periph.UCA0RXBUF;
   end Receive;

   function Data_Available return Boolean is
   begin
      return SPECIAL_FUNCTION_Periph.IFG2.UCA0RXIFG = 1;
   end Data_Available;

end MSPGD.UART.Peripheral;
