--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  USCI_A0  UART Mode
package MSP430_SVD.USCI_A0_UART_MODE is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  UCA0ABCTL_UCDELIM array
   type UCA0ABCTL_UCDELIM_Field_Array is array (0 .. 1) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 2;

   --  Type definition for UCA0ABCTL_UCDELIM
   type UCA0ABCTL_UCDELIM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UCDELIM as a value
            Val : MSP430_SVD.UInt2;
         when True =>
            --  UCDELIM as an array
            Arr : UCA0ABCTL_UCDELIM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for UCA0ABCTL_UCDELIM_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  USCI A0 LIN Control
   type UCA0ABCTL_Register is record
      --  Auto Baud Rate detect enable
      UCABDEN      : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_1_1 : MSP430_SVD.Bit := 16#0#;
      --  Break Timeout error
      UCBTOE       : MSP430_SVD.Bit := 16#0#;
      --  Sync-Field Timeout error
      UCSTOE       : MSP430_SVD.Bit := 16#0#;
      --  Break Sync Delimiter 0
      UCDELIM      : UCA0ABCTL_UCDELIM_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_7 : MSP430_SVD.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0ABCTL_Register use record
      UCABDEN      at 0 range 0 .. 0;
      Reserved_1_1 at 0 range 1 .. 1;
      UCBTOE       at 0 range 2 .. 2;
      UCSTOE       at 0 range 3 .. 3;
      UCDELIM      at 0 range 4 .. 5;
      Reserved_6_7 at 0 range 6 .. 7;
   end record;

   --  UCA0IRTCTL_UCIRTXPL array
   type UCA0IRTCTL_UCIRTXPL_Field_Array is array (0 .. 5) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 6;

   --  Type definition for UCA0IRTCTL_UCIRTXPL
   type UCA0IRTCTL_UCIRTXPL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UCIRTXPL as a value
            Val : MSP430_SVD.UInt6;
         when True =>
            --  UCIRTXPL as an array
            Arr : UCA0IRTCTL_UCIRTXPL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for UCA0IRTCTL_UCIRTXPL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  USCI A0 IrDA Transmit Control
   type UCA0IRTCTL_Register is record
      --  IRDA Encoder/Decoder enable
      UCIREN    : MSP430_SVD.Bit := 16#0#;
      --  IRDA Transmit Pulse Clock Select
      UCIRTXCLK : MSP430_SVD.Bit := 16#0#;
      --  IRDA Transmit Pulse Length 0
      UCIRTXPL  : UCA0IRTCTL_UCIRTXPL_Field :=
                   (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0IRTCTL_Register use record
      UCIREN    at 0 range 0 .. 0;
      UCIRTXCLK at 0 range 1 .. 1;
      UCIRTXPL  at 0 range 2 .. 7;
   end record;

   --  UCA0IRRCTL_UCIRRXFL array
   type UCA0IRRCTL_UCIRRXFL_Field_Array is array (0 .. 5) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 6;

   --  Type definition for UCA0IRRCTL_UCIRRXFL
   type UCA0IRRCTL_UCIRRXFL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UCIRRXFL as a value
            Val : MSP430_SVD.UInt6;
         when True =>
            --  UCIRRXFL as an array
            Arr : UCA0IRRCTL_UCIRRXFL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for UCA0IRRCTL_UCIRRXFL_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  USCI A0 IrDA Receive Control
   type UCA0IRRCTL_Register is record
      --  IRDA Receive Filter enable
      UCIRRXFE : MSP430_SVD.Bit := 16#0#;
      --  IRDA Receive Input Polarity
      UCIRRXPL : MSP430_SVD.Bit := 16#0#;
      --  IRDA Receive Filter Length 0
      UCIRRXFL : UCA0IRRCTL_UCIRRXFL_Field :=
                  (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0IRRCTL_Register use record
      UCIRRXFE at 0 range 0 .. 0;
      UCIRRXPL at 0 range 1 .. 1;
      UCIRRXFL at 0 range 2 .. 7;
   end record;

   --  Async. Mode: USCI Mode 1
   type UCA0CTL0_UCMODE_Field is
     (--  Sync. Mode: USCI Mode: 0
      Ucmode_0,
      --  Sync. Mode: USCI Mode: 1
      Ucmode_1,
      --  Sync. Mode: USCI Mode: 2
      Ucmode_2,
      --  Sync. Mode: USCI Mode: 3
      Ucmode_3)
     with Size => 2;
   for UCA0CTL0_UCMODE_Field use
     (Ucmode_0 => 0,
      Ucmode_1 => 1,
      Ucmode_2 => 2,
      Ucmode_3 => 3);

   --  USCI A0 Control Register 0
   type UCA0CTL0_Register is record
      --  Sync-Mode 0:UART-Mode / 1:SPI-Mode
      UCSYNC : MSP430_SVD.Bit := 16#0#;
      --  Async. Mode: USCI Mode 1
      UCMODE : UCA0CTL0_UCMODE_Field := MSP430_SVD.USCI_A0_UART_MODE.Ucmode_0;
      --  Async. Mode: Stop Bits 0:one / 1: two
      UCSPB  : MSP430_SVD.Bit := 16#0#;
      --  Async. Mode: Data Bits 0:8-bits / 1:7-bits
      UC7BIT : MSP430_SVD.Bit := 16#0#;
      --  Async. Mode: MSB first 0:LSB / 1:MSB
      UCMSB  : MSP430_SVD.Bit := 16#0#;
      --  Async. Mode: Parity 0:odd / 1:even
      UCPAR  : MSP430_SVD.Bit := 16#0#;
      --  Async. Mode: Parity enable
      UCPEN  : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0CTL0_Register use record
      UCSYNC at 0 range 0 .. 0;
      UCMODE at 0 range 1 .. 2;
      UCSPB  at 0 range 3 .. 3;
      UC7BIT at 0 range 4 .. 4;
      UCMSB  at 0 range 5 .. 5;
      UCPAR  at 0 range 6 .. 6;
      UCPEN  at 0 range 7 .. 7;
   end record;

   --  USCI 0 Clock Source Select 1
   type UCA0CTL1_UCSSEL_Field is
     (--  USCI 0 Clock Source: 0
      Ucssel_0,
      --  USCI 0 Clock Source: 1
      Ucssel_1,
      --  USCI 0 Clock Source: 2
      Ucssel_2,
      --  USCI 0 Clock Source: 3
      Ucssel_3)
     with Size => 2;
   for UCA0CTL1_UCSSEL_Field use
     (Ucssel_0 => 0,
      Ucssel_1 => 1,
      Ucssel_2 => 2,
      Ucssel_3 => 3);

   --  USCI A0 Control Register 1
   type UCA0CTL1_Register is record
      --  USCI Software Reset
      UCSWRST  : MSP430_SVD.Bit := 16#0#;
      --  Send next Data as Break
      UCTXBRK  : MSP430_SVD.Bit := 16#0#;
      --  Send next Data as Address
      UCTXADDR : MSP430_SVD.Bit := 16#0#;
      --  Dormant (Sleep) Mode
      UCDORM   : MSP430_SVD.Bit := 16#0#;
      --  Break interrupt enable
      UCBRKIE  : MSP430_SVD.Bit := 16#0#;
      --  RX Error interrupt enable
      UCRXEIE  : MSP430_SVD.Bit := 16#0#;
      --  USCI 0 Clock Source Select 1
      UCSSEL   : UCA0CTL1_UCSSEL_Field :=
                  MSP430_SVD.USCI_A0_UART_MODE.Ucssel_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0CTL1_Register use record
      UCSWRST  at 0 range 0 .. 0;
      UCTXBRK  at 0 range 1 .. 1;
      UCTXADDR at 0 range 2 .. 2;
      UCDORM   at 0 range 3 .. 3;
      UCBRKIE  at 0 range 4 .. 4;
      UCRXEIE  at 0 range 5 .. 5;
      UCSSEL   at 0 range 6 .. 7;
   end record;

   --  USCI Second Stage Modulation Select 2
   type UCA0MCTL_UCBRS_Field is
     (--  USCI Second Stage Modulation: 0
      Ucbrs_0,
      --  USCI Second Stage Modulation: 1
      Ucbrs_1,
      --  USCI Second Stage Modulation: 2
      Ucbrs_2,
      --  USCI Second Stage Modulation: 3
      Ucbrs_3,
      --  USCI Second Stage Modulation: 4
      Ucbrs_4,
      --  USCI Second Stage Modulation: 5
      Ucbrs_5,
      --  USCI Second Stage Modulation: 6
      Ucbrs_6,
      --  USCI Second Stage Modulation: 7
      Ucbrs_7)
     with Size => 3;
   for UCA0MCTL_UCBRS_Field use
     (Ucbrs_0 => 0,
      Ucbrs_1 => 1,
      Ucbrs_2 => 2,
      Ucbrs_3 => 3,
      Ucbrs_4 => 4,
      Ucbrs_5 => 5,
      Ucbrs_6 => 6,
      Ucbrs_7 => 7);

   --  USCI First Stage Modulation Select 3
   type UCA0MCTL_UCBRF_Field is
     (--  USCI First Stage Modulation: 0
      Ucbrf_0,
      --  USCI First Stage Modulation: 1
      Ucbrf_1,
      --  USCI First Stage Modulation: 2
      Ucbrf_2,
      --  USCI First Stage Modulation: 3
      Ucbrf_3,
      --  USCI First Stage Modulation: 4
      Ucbrf_4,
      --  USCI First Stage Modulation: 5
      Ucbrf_5,
      --  USCI First Stage Modulation: 6
      Ucbrf_6,
      --  USCI First Stage Modulation: 7
      Ucbrf_7,
      --  USCI First Stage Modulation: 8
      Ucbrf_8,
      --  USCI First Stage Modulation: 9
      Ucbrf_9,
      --  USCI First Stage Modulation: A
      Ucbrf_10,
      --  USCI First Stage Modulation: B
      Ucbrf_11,
      --  USCI First Stage Modulation: C
      Ucbrf_12,
      --  USCI First Stage Modulation: D
      Ucbrf_13,
      --  USCI First Stage Modulation: E
      Ucbrf_14,
      --  USCI First Stage Modulation: F
      Ucbrf_15)
     with Size => 4;
   for UCA0MCTL_UCBRF_Field use
     (Ucbrf_0 => 0,
      Ucbrf_1 => 1,
      Ucbrf_2 => 2,
      Ucbrf_3 => 3,
      Ucbrf_4 => 4,
      Ucbrf_5 => 5,
      Ucbrf_6 => 6,
      Ucbrf_7 => 7,
      Ucbrf_8 => 8,
      Ucbrf_9 => 9,
      Ucbrf_10 => 10,
      Ucbrf_11 => 11,
      Ucbrf_12 => 12,
      Ucbrf_13 => 13,
      Ucbrf_14 => 14,
      Ucbrf_15 => 15);

   --  USCI A0 Modulation Control
   type UCA0MCTL_Register is record
      --  USCI 16-times Oversampling enable
      UCOS16 : MSP430_SVD.Bit := 16#0#;
      --  USCI Second Stage Modulation Select 2
      UCBRS  : UCA0MCTL_UCBRS_Field := MSP430_SVD.USCI_A0_UART_MODE.Ucbrs_0;
      --  USCI First Stage Modulation Select 3
      UCBRF  : UCA0MCTL_UCBRF_Field := MSP430_SVD.USCI_A0_UART_MODE.Ucbrf_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0MCTL_Register use record
      UCOS16 at 0 range 0 .. 0;
      UCBRS  at 0 range 1 .. 3;
      UCBRF  at 0 range 4 .. 7;
   end record;

   --  USCI A0 Status Register
   type UCA0STAT_Register is record
      --  USCI Busy Flag
      UCBUSY   : MSP430_SVD.Bit := 16#0#;
      --  USCI Address received Flag
      UCADDR   : MSP430_SVD.Bit := 16#0#;
      --  USCI RX Error Flag
      UCRXERR  : MSP430_SVD.Bit := 16#0#;
      --  USCI Break received
      UCBRK    : MSP430_SVD.Bit := 16#0#;
      --  USCI Parity Error Flag
      UCPE     : MSP430_SVD.Bit := 16#0#;
      --  USCI Overrun Error Flag
      UCOE     : MSP430_SVD.Bit := 16#0#;
      --  USCI Frame Error Flag
      UCFE     : MSP430_SVD.Bit := 16#0#;
      --  USCI Listen mode
      UCLISTEN : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0STAT_Register use record
      UCBUSY   at 0 range 0 .. 0;
      UCADDR   at 0 range 1 .. 1;
      UCRXERR  at 0 range 2 .. 2;
      UCBRK    at 0 range 3 .. 3;
      UCPE     at 0 range 4 .. 4;
      UCOE     at 0 range 5 .. 5;
      UCFE     at 0 range 6 .. 6;
      UCLISTEN at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USCI_A0 UART Mode
   type USCI_A0_UART_MODE_Peripheral is record
      --  USCI A0 LIN Control
      UCA0ABCTL  : aliased UCA0ABCTL_Register;
      --  USCI A0 IrDA Transmit Control
      UCA0IRTCTL : aliased UCA0IRTCTL_Register;
      --  USCI A0 IrDA Receive Control
      UCA0IRRCTL : aliased UCA0IRRCTL_Register;
      --  USCI A0 Control Register 0
      UCA0CTL0   : aliased UCA0CTL0_Register;
      --  USCI A0 Control Register 1
      UCA0CTL1   : aliased UCA0CTL1_Register;
      --  USCI A0 Baud Rate 0
      UCA0BR0    : aliased MSP430_SVD.Byte;
      --  USCI A0 Baud Rate 1
      UCA0BR1    : aliased MSP430_SVD.Byte;
      --  USCI A0 Modulation Control
      UCA0MCTL   : aliased UCA0MCTL_Register;
      --  USCI A0 Status Register
      UCA0STAT   : aliased UCA0STAT_Register;
      --  USCI A0 Receive Buffer
      UCA0RXBUF  : aliased MSP430_SVD.Byte;
      --  USCI A0 Transmit Buffer
      UCA0TXBUF  : aliased MSP430_SVD.Byte;
   end record
     with Volatile;

   for USCI_A0_UART_MODE_Peripheral use record
      UCA0ABCTL  at 16#1# range 0 .. 7;
      UCA0IRTCTL at 16#2# range 0 .. 7;
      UCA0IRRCTL at 16#3# range 0 .. 7;
      UCA0CTL0   at 16#4# range 0 .. 7;
      UCA0CTL1   at 16#5# range 0 .. 7;
      UCA0BR0    at 16#6# range 0 .. 7;
      UCA0BR1    at 16#7# range 0 .. 7;
      UCA0MCTL   at 16#8# range 0 .. 7;
      UCA0STAT   at 16#9# range 0 .. 7;
      UCA0RXBUF  at 16#A# range 0 .. 7;
      UCA0TXBUF  at 16#B# range 0 .. 7;
   end record;

   --  USCI_A0 UART Mode
   USCI_A0_UART_MODE_Periph : aliased USCI_A0_UART_MODE_Peripheral
     with Import, Address => USCI_A0_UART_MODE_Base;

end MSP430_SVD.USCI_A0_UART_MODE;
