--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  USCI_B0  SPI Mode
package MSP430_SVD.USCI_B0_SPI_MODE is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Sync. Mode: USCI Mode 1
   type UCB0CTL0_SPI_UCMODE_Field is
     (--  Sync. Mode: USCI Mode: 0
      Ucmode_0,
      --  Sync. Mode: USCI Mode: 1
      Ucmode_1,
      --  Sync. Mode: USCI Mode: 2
      Ucmode_2,
      --  Sync. Mode: USCI Mode: 3
      Ucmode_3)
     with Size => 2;
   for UCB0CTL0_SPI_UCMODE_Field use
     (Ucmode_0 => 0,
      Ucmode_1 => 1,
      Ucmode_2 => 2,
      Ucmode_3 => 3);

   --  USCI B0 Control Register 0
   type UCB0CTL0_SPI_Register is record
      --  Sync-Mode 0:UART-Mode / 1:SPI-Mode
      UCSYNC : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: USCI Mode 1
      UCMODE : UCB0CTL0_SPI_UCMODE_Field :=
                MSP430_SVD.USCI_B0_SPI_MODE.Ucmode_0;
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

   for UCB0CTL0_SPI_Register use record
      UCSYNC at 0 range 0 .. 0;
      UCMODE at 0 range 1 .. 2;
      UCMST  at 0 range 3 .. 3;
      UC7BIT at 0 range 4 .. 4;
      UCMSB  at 0 range 5 .. 5;
      UCCKPL at 0 range 6 .. 6;
      UCCKPH at 0 range 7 .. 7;
   end record;

   --  USCI 1 Clock Source Select 1
   type UCB0CTL1_SPI_UCSSEL_Field is
     (--  USCI 0 Clock Source: 0
      Ucssel_0,
      --  USCI 0 Clock Source: 1
      Ucssel_1,
      --  USCI 0 Clock Source: 2
      Ucssel_2,
      --  USCI 0 Clock Source: 3
      Ucssel_3)
     with Size => 2;
   for UCB0CTL1_SPI_UCSSEL_Field use
     (Ucssel_0 => 0,
      Ucssel_1 => 1,
      Ucssel_2 => 2,
      Ucssel_3 => 3);

   --  USCI B0 Control Register 1
   type UCB0CTL1_SPI_Register is record
      --  USCI Software Reset
      UCSWRST      : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_1_5 : MSP430_SVD.UInt5 := 16#0#;
      --  USCI 1 Clock Source Select 1
      UCSSEL       : UCB0CTL1_SPI_UCSSEL_Field :=
                      MSP430_SVD.USCI_B0_SPI_MODE.Ucssel_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCB0CTL1_SPI_Register use record
      UCSWRST      at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      UCSSEL       at 0 range 6 .. 7;
   end record;

   --  USCI B0 Status Register
   type UCB0STAT_SPI_Register is record
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

   for UCB0STAT_SPI_Register use record
      UCBUSY       at 0 range 0 .. 0;
      Reserved_1_4 at 0 range 1 .. 4;
      UCOE         at 0 range 5 .. 5;
      UCFE         at 0 range 6 .. 6;
      UCLISTEN     at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USCI_B0 SPI Mode
   type USCI_B0_SPI_MODE_Peripheral is record
      --  USCI B0 Control Register 0
      UCB0CTL0_SPI  : aliased UCB0CTL0_SPI_Register;
      --  USCI B0 Control Register 1
      UCB0CTL1_SPI  : aliased UCB0CTL1_SPI_Register;
      --  USCI B0 Baud Rate 0
      UCB0BR0_SPI   : aliased MSP430_SVD.Byte;
      --  USCI B0 Baud Rate 1
      UCB0BR1_SPI   : aliased MSP430_SVD.Byte;
      --  USCI B0 Status Register
      UCB0STAT_SPI  : aliased UCB0STAT_SPI_Register;
      --  USCI B0 Receive Buffer
      UCB0RXBUF_SPI : aliased MSP430_SVD.Byte;
      --  USCI B0 Transmit Buffer
      UCB0TXBUF_SPI : aliased MSP430_SVD.Byte;
   end record
     with Volatile;

   for USCI_B0_SPI_MODE_Peripheral use record
      UCB0CTL0_SPI  at 16#0# range 0 .. 7;
      UCB0CTL1_SPI  at 16#1# range 0 .. 7;
      UCB0BR0_SPI   at 16#2# range 0 .. 7;
      UCB0BR1_SPI   at 16#3# range 0 .. 7;
      UCB0STAT_SPI  at 16#5# range 0 .. 7;
      UCB0RXBUF_SPI at 16#6# range 0 .. 7;
      UCB0TXBUF_SPI at 16#7# range 0 .. 7;
   end record;

   --  USCI_B0 SPI Mode
   USCI_B0_SPI_MODE_Periph : aliased USCI_B0_SPI_MODE_Peripheral
     with Import, Address => USCI_B0_SPI_MODE_Base;

end MSP430_SVD.USCI_B0_SPI_MODE;
