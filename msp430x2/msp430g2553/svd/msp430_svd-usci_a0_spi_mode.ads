--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  USCI_A0  SPI Mode
package MSP430_SVD.USCI_A0_SPI_MODE is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Sync. Mode: USCI Mode 1
   type UCA0CTL0_SPI_UCMODE_Field is
     (--  Sync. Mode: USCI Mode: 0
      Ucmode_0,
      --  Sync. Mode: USCI Mode: 1
      Ucmode_1,
      --  Sync. Mode: USCI Mode: 2
      Ucmode_2,
      --  Sync. Mode: USCI Mode: 3
      Ucmode_3)
     with Size => 2;
   for UCA0CTL0_SPI_UCMODE_Field use
     (Ucmode_0 => 0,
      Ucmode_1 => 1,
      Ucmode_2 => 2,
      Ucmode_3 => 3);

   --  USCI A0 Control Register 0
   type UCA0CTL0_SPI_Register is record
      --  Sync-Mode 0:UART-Mode / 1:SPI-Mode
      UCSYNC : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: USCI Mode 1
      UCMODE : UCA0CTL0_SPI_UCMODE_Field :=
                MSP430_SVD.USCI_A0_SPI_MODE.Ucmode_0;
      --  Sync. Mode: Master Select
      UCMST  : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: Data Bits 0:8-bits / 1:7-bits
      UC7BIT : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: MSB first 0:LSB / 1:MSB
      UCMSB  : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: Clock Polarity
      UCCKPL : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: Clock Phase
      UCCKPH : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0CTL0_SPI_Register use record
      UCSYNC at 0 range 0 .. 0;
      UCMODE at 0 range 1 .. 2;
      UCMST  at 0 range 3 .. 3;
      UC7BIT at 0 range 4 .. 4;
      UCMSB  at 0 range 5 .. 5;
      UCCKPL at 0 range 6 .. 6;
      UCCKPH at 0 range 7 .. 7;
   end record;

   --  USCI 1 Clock Source Select 1
   type UCA0CTL1_SPI_UCSSEL_Field is
     (--  USCI 0 Clock Source: 0
      Ucssel_0,
      --  USCI 0 Clock Source: 1
      Ucssel_1,
      --  USCI 0 Clock Source: 2
      Ucssel_2,
      --  USCI 0 Clock Source: 3
      Ucssel_3)
     with Size => 2;
   for UCA0CTL1_SPI_UCSSEL_Field use
     (Ucssel_0 => 0,
      Ucssel_1 => 1,
      Ucssel_2 => 2,
      Ucssel_3 => 3);

   --  USCI A0 Control Register 1
   type UCA0CTL1_SPI_Register is record
      --  USCI Software Reset
      UCSWRST      : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_1_5 : MSP430_SVD.UInt5 := 16#0#;
      --  USCI 1 Clock Source Select 1
      UCSSEL       : UCA0CTL1_SPI_UCSSEL_Field :=
                      MSP430_SVD.USCI_A0_SPI_MODE.Ucssel_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0CTL1_SPI_Register use record
      UCSWRST      at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      UCSSEL       at 0 range 6 .. 7;
   end record;

   --  USCI A0 Status Register
   type UCA0STAT_SPI_Register is record
      --  USCI Busy Flag
      UCBUSY       : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_1_4 : MSP430_SVD.UInt4 := 16#0#;
      --  USCI Overrun Error Flag
      UCOE         : MSP430_SVD.Bit := 16#0#;
      --  USCI Frame Error Flag
      UCFE         : MSP430_SVD.Bit := 16#0#;
      --  USCI Listen mode
      UCLISTEN     : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCA0STAT_SPI_Register use record
      UCBUSY       at 0 range 0 .. 0;
      Reserved_1_4 at 0 range 1 .. 4;
      UCOE         at 0 range 5 .. 5;
      UCFE         at 0 range 6 .. 6;
      UCLISTEN     at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USCI_A0 SPI Mode
   type USCI_A0_SPI_MODE_Peripheral is record
      --  USCI A0 Control Register 0
      UCA0CTL0_SPI  : aliased UCA0CTL0_SPI_Register;
      --  USCI A0 Control Register 1
      UCA0CTL1_SPI  : aliased UCA0CTL1_SPI_Register;
      --  USCI A0 Baud Rate 0
      UCA0BR0_SPI   : aliased MSP430_SVD.Byte;
      --  USCI A0 Baud Rate 1
      UCA0BR1_SPI   : aliased MSP430_SVD.Byte;
      --  USCI A0 Modulation Control
      UCA0MCTL_SPI  : aliased MSP430_SVD.Byte;
      --  USCI A0 Status Register
      UCA0STAT_SPI  : aliased UCA0STAT_SPI_Register;
      --  USCI A0 Receive Buffer
      UCA0RXBUF_SPI : aliased MSP430_SVD.Byte;
      --  USCI A0 Transmit Buffer
      UCA0TXBUF_SPI : aliased MSP430_SVD.Byte;
   end record
     with Volatile;

   for USCI_A0_SPI_MODE_Peripheral use record
      UCA0CTL0_SPI  at 16#0# range 0 .. 7;
      UCA0CTL1_SPI  at 16#1# range 0 .. 7;
      UCA0BR0_SPI   at 16#2# range 0 .. 7;
      UCA0BR1_SPI   at 16#3# range 0 .. 7;
      UCA0MCTL_SPI  at 16#4# range 0 .. 7;
      UCA0STAT_SPI  at 16#5# range 0 .. 7;
      UCA0RXBUF_SPI at 16#6# range 0 .. 7;
      UCA0TXBUF_SPI at 16#7# range 0 .. 7;
   end record;

   --  USCI_A0 SPI Mode
   USCI_A0_SPI_MODE_Periph : aliased USCI_A0_SPI_MODE_Peripheral
     with Import, Address => USCI_A0_SPI_MODE_Base;

end MSP430_SVD.USCI_A0_SPI_MODE;
