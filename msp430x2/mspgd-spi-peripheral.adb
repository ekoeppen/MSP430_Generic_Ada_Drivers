with MSP430_SVD.USCI_A0_SPI_MODE; use MSP430_SVD.USCI_A0_SPI_MODE;
with MSP430_SVD.USCI_B0_SPI_MODE; use MSP430_SVD.USCI_B0_SPI_MODE;
with MSP430_SVD.SPECIAL_FUNCTION; use MSP430_SVD.SPECIAL_FUNCTION;

package body MSPGD.SPI.Peripheral is

   procedure Init is
      use MSPGD.Clock;
      Baud_Rate_Div : constant UInt32 := UInt32 (Clock.Frequency) / Speed;
   begin
      case Module is
         when USCI_A =>
            USCI_A0_SPI_MODE_Periph.UCA0CTL1_SPI.UCSWRST := 1;
            case Clock.Source is
               when ACLK => USCI_A0_SPI_MODE_Periph.UCA0CTL1_SPI.UCSSEL := UCSSEL_1;
               when SMCLK => USCI_A0_SPI_MODE_Periph.UCA0CTL1_SPI.UCSSEL := UCSSEL_2;
               when others => null;
            end case;
            USCI_A0_SPI_MODE_Periph.UCA0BR0_SPI := Byte (Baud_Rate_Div mod 256);
            USCI_A0_SPI_MODE_Periph.UCA0BR1_SPI := Byte ((Baud_Rate_Div / 256) mod 256);
            USCI_A0_SPI_MODE_Periph.UCA0CTL0_SPI := (
               UCMSB => 1,
               UCMST => 1,
               UCSYNC => 1,
               UCCKPH => (if Mode = Mode_0 or else Mode = Mode_2 then 1 else 0),
               UCCKPL => (if Mode = Mode_1 or else Mode = Mode_3 then 1 else 0),
               UCMODE => Ucmode_0,
               others => 0
               );
            USCI_A0_SPI_MODE_Periph.UCA0CTL1_SPI.UCSWRST := 0;
         when USCI_B =>
            USCI_B0_SPI_MODE_Periph.UCB0CTL1_SPI.UCSWRST := 1;
            case Clock.Source is
               when ACLK => USCI_B0_SPI_MODE_Periph.UCB0CTL1_SPI.UCSSEL := UCSSEL_1;
               when SMCLK => USCI_B0_SPI_MODE_Periph.UCB0CTL1_SPI.UCSSEL := UCSSEL_2;
               when others => null;
            end case;
            USCI_B0_SPI_MODE_Periph.UCB0BR0_SPI := Byte (Baud_Rate_Div mod 256);
            USCI_B0_SPI_MODE_Periph.UCB0BR1_SPI := Byte ((Baud_Rate_Div / 256) mod 256);
            USCI_B0_SPI_MODE_Periph.UCB0CTL0_SPI := (
               UCMSB => 1,
               UCMST => 1,
               UCSYNC => 1,
               UCCKPH => (if Mode = Mode_0 or else Mode = Mode_2 then 1 else 0),
               UCCKPL => (if Mode = Mode_1 or else Mode = Mode_3 then 1 else 0),
               UCMODE => Ucmode_0,
               others => 0
               );
            USCI_B0_SPI_MODE_Periph.UCB0CTL1_SPI.UCSWRST := 0;
      end case;
   end Init;

   procedure Wait_For_TX_Complete is
   begin
      case Module is
         when USCI_A => while SPECIAL_FUNCTION_Periph.IFG2.UCA0TXIFG = 0 loop null; end loop;
         when USCI_B => while SPECIAL_FUNCTION_Periph.IFG2.UCB0TXIFG = 0 loop null; end loop;
      end case;
   end Wait_For_TX_Complete;

   procedure Wait_For_RX_Complete is
   begin
      case Module is
         when USCI_A => while SPECIAL_FUNCTION_Periph.IFG2.UCA0RXIFG = 0 loop null; end loop;
         when USCI_B => while SPECIAL_FUNCTION_Periph.IFG2.UCB0RXIFG = 0 loop null; end loop;
      end case;
   end Wait_For_RX_Complete;

   procedure Transfer (Data : in out Unsigned_8) is
   begin
      Wait_For_TX_Complete;
      case Module is
         when USCI_A => USCI_A0_SPI_MODE_Periph.UCA0TXBUF_SPI := Byte (Data);
         when USCI_B => USCI_B0_SPI_MODE_Periph.UCB0TXBUF_SPI := Byte (Data);
      end case;
      Wait_For_RX_Complete;
      case Module is
         when USCI_A => Data := Unsigned_8 (USCI_A0_SPI_MODE_Periph.UCA0RXBUF_SPI);
         when USCI_B => Data := Unsigned_8 (USCI_B0_SPI_MODE_Periph.UCB0RXBUF_SPI);
      end case;
   end Transfer;

   procedure Transfer (Data : in out Buffer_Type) is
   begin
      for I in Data'Range loop
         Transfer (Data (I));
      end loop;
   end Transfer;

   procedure Send (Data : in Unsigned_8) is
      D : Unsigned_8 := Data;
   begin
      Transfer (D);
   end Send;

   procedure Send (Data : in Buffer_Type) is
   begin
      for D of Data loop
         Send (D);
      end loop;
   end Send;

   procedure Receive (Data : out Unsigned_8) is
      D : Unsigned_8 := 0;
   begin
      Transfer (D);
      Data := D;
   end Receive;

   procedure Receive (Data : out Buffer_Type) is
   begin
      for I in Data'Range loop
         Receive (Data (I));
      end loop;
   end Receive;

end MSPGD.SPI.Peripheral;
