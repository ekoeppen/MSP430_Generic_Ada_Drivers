--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  USCI_B0  I2C Mode
package MSP430_SVD.USCI_B0_I2C_MODE is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Sync. Mode: USCI Mode 1
   type UCB0CTL0_UCMODE_Field is
     (--  Sync. Mode: USCI Mode: 0
      Ucmode_0,
      --  Sync. Mode: USCI Mode: 1
      Ucmode_1,
      --  Sync. Mode: USCI Mode: 2
      Ucmode_2,
      --  Sync. Mode: USCI Mode: 3
      Ucmode_3)
     with Size => 2;
   for UCB0CTL0_UCMODE_Field use
     (Ucmode_0 => 0,
      Ucmode_1 => 1,
      Ucmode_2 => 2,
      Ucmode_3 => 3);

   --  USCI B0 Control Register 0
   type UCB0CTL0_Register is record
      --  Sync-Mode 0:UART-Mode / 1:SPI-Mode
      UCSYNC       : MSP430_SVD.Bit := 16#0#;
      --  Sync. Mode: USCI Mode 1
      UCMODE       : UCB0CTL0_UCMODE_Field :=
                      MSP430_SVD.USCI_B0_I2C_MODE.Ucmode_0;
      --  Sync. Mode: Master Select
      UCMST        : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_4_4 : MSP430_SVD.Bit := 16#0#;
      --  Multi-Master Environment
      UCMM         : MSP430_SVD.Bit := 16#0#;
      --  10-bit Slave Address Mode
      UCSLA10      : MSP430_SVD.Bit := 16#0#;
      --  10-bit Address Mode
      UCA10        : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCB0CTL0_Register use record
      UCSYNC       at 0 range 0 .. 0;
      UCMODE       at 0 range 1 .. 2;
      UCMST        at 0 range 3 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      UCMM         at 0 range 5 .. 5;
      UCSLA10      at 0 range 6 .. 6;
      UCA10        at 0 range 7 .. 7;
   end record;

   --  USCI 1 Clock Source Select 1
   type UCB0CTL1_UCSSEL_Field is
     (--  USCI 0 Clock Source: 0
      Ucssel_0,
      --  USCI 0 Clock Source: 1
      Ucssel_1,
      --  USCI 0 Clock Source: 2
      Ucssel_2,
      --  USCI 0 Clock Source: 3
      Ucssel_3)
     with Size => 2;
   for UCB0CTL1_UCSSEL_Field use
     (Ucssel_0 => 0,
      Ucssel_1 => 1,
      Ucssel_2 => 2,
      Ucssel_3 => 3);

   --  USCI B0 Control Register 1
   type UCB0CTL1_Register is record
      --  USCI Software Reset
      UCSWRST      : MSP430_SVD.Bit := 16#0#;
      --  Transmit START
      UCTXSTT      : MSP430_SVD.Bit := 16#0#;
      --  Transmit STOP
      UCTXSTP      : MSP430_SVD.Bit := 16#0#;
      --  Transmit NACK
      UCTXNACK     : MSP430_SVD.Bit := 16#0#;
      --  Transmit/Receive Select/Flag
      UCTR         : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_5_5 : MSP430_SVD.Bit := 16#0#;
      --  USCI 1 Clock Source Select 1
      UCSSEL       : UCB0CTL1_UCSSEL_Field :=
                      MSP430_SVD.USCI_B0_I2C_MODE.Ucssel_0;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCB0CTL1_Register use record
      UCSWRST      at 0 range 0 .. 0;
      UCTXSTT      at 0 range 1 .. 1;
      UCTXSTP      at 0 range 2 .. 2;
      UCTXNACK     at 0 range 3 .. 3;
      UCTR         at 0 range 4 .. 4;
      Reserved_5_5 at 0 range 5 .. 5;
      UCSSEL       at 0 range 6 .. 7;
   end record;

   --  USCI B0 I2C Interrupt Enable Register
   type UCB0I2CIE_Register is record
      --  Arbitration Lost interrupt enable
      UCALIE       : MSP430_SVD.Bit := 16#0#;
      --  START Condition interrupt enable
      UCSTTIE      : MSP430_SVD.Bit := 16#0#;
      --  STOP Condition interrupt enable
      UCSTPIE      : MSP430_SVD.Bit := 16#0#;
      --  NACK Condition interrupt enable
      UCNACKIE     : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_4_7 : MSP430_SVD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCB0I2CIE_Register use record
      UCALIE       at 0 range 0 .. 0;
      UCSTTIE      at 0 range 1 .. 1;
      UCSTPIE      at 0 range 2 .. 2;
      UCNACKIE     at 0 range 3 .. 3;
      Reserved_4_7 at 0 range 4 .. 7;
   end record;

   --  USCI B0 Status Register
   type UCB0STAT_Register is record
      --  Arbitration Lost interrupt Flag
      UCALIFG   : MSP430_SVD.Bit := 16#0#;
      --  START Condition interrupt Flag
      UCSTTIFG  : MSP430_SVD.Bit := 16#0#;
      --  STOP Condition interrupt Flag
      UCSTPIFG  : MSP430_SVD.Bit := 16#0#;
      --  NAK Condition interrupt Flag
      UCNACKIFG : MSP430_SVD.Bit := 16#0#;
      --  Bus Busy Flag
      UCBBUSY   : MSP430_SVD.Bit := 16#0#;
      --  General Call address received Flag
      UCGC      : MSP430_SVD.Bit := 16#0#;
      --  SCL low
      UCSCLLOW  : MSP430_SVD.Bit := 16#0#;
      --  USCI Listen mode
      UCLISTEN  : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for UCB0STAT_Register use record
      UCALIFG   at 0 range 0 .. 0;
      UCSTTIFG  at 0 range 1 .. 1;
      UCSTPIFG  at 0 range 2 .. 2;
      UCNACKIFG at 0 range 3 .. 3;
      UCBBUSY   at 0 range 4 .. 4;
      UCGC      at 0 range 5 .. 5;
      UCSCLLOW  at 0 range 6 .. 6;
      UCLISTEN  at 0 range 7 .. 7;
   end record;

   --  UCB0I2COA_UCOA array
   type UCB0I2COA_UCOA_Field_Array is array (0 .. 9) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 10;

   --  Type definition for UCB0I2COA_UCOA
   type UCB0I2COA_UCOA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UCOA as a value
            Val : MSP430_SVD.UInt10;
         when True =>
            --  UCOA as an array
            Arr : UCB0I2COA_UCOA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for UCB0I2COA_UCOA_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  USCI B0 I2C Own Address
   type UCB0I2COA_Register is record
      --  I2C Own Address 0
      UCOA           : UCB0I2COA_UCOA_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_14 : MSP430_SVD.UInt5 := 16#0#;
      --  I2C General Call enable
      UCGCEN         : MSP430_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for UCB0I2COA_Register use record
      UCOA           at 0 range 0 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      UCGCEN         at 0 range 15 .. 15;
   end record;

   --  UCB0I2CSA_UCSA array
   type UCB0I2CSA_UCSA_Field_Array is array (0 .. 9) of MSP430_SVD.Bit
     with Component_Size => 1, Size => 10;

   --  Type definition for UCB0I2CSA_UCSA
   type UCB0I2CSA_UCSA_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  UCSA as a value
            Val : MSP430_SVD.UInt10;
         when True =>
            --  UCSA as an array
            Arr : UCB0I2CSA_UCSA_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 10;

   for UCB0I2CSA_UCSA_Field use record
      Val at 0 range 0 .. 9;
      Arr at 0 range 0 .. 9;
   end record;

   --  USCI B0 I2C Slave Address
   type UCB0I2CSA_Register is record
      --  I2C Slave Address 0
      UCSA           : UCB0I2CSA_UCSA_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_15 : MSP430_SVD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for UCB0I2CSA_Register use record
      UCSA           at 0 range 0 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  USCI_B0 I2C Mode
   type USCI_B0_I2C_MODE_Peripheral is record
      --  USCI B0 Control Register 0
      UCB0CTL0  : aliased UCB0CTL0_Register;
      --  USCI B0 Control Register 1
      UCB0CTL1  : aliased UCB0CTL1_Register;
      --  USCI B0 Baud Rate 0
      UCB0BR0   : aliased MSP430_SVD.Byte;
      --  USCI B0 Baud Rate 1
      UCB0BR1   : aliased MSP430_SVD.Byte;
      --  USCI B0 I2C Interrupt Enable Register
      UCB0I2CIE : aliased UCB0I2CIE_Register;
      --  USCI B0 Status Register
      UCB0STAT  : aliased UCB0STAT_Register;
      --  USCI B0 Receive Buffer
      UCB0RXBUF : aliased MSP430_SVD.Byte;
      --  USCI B0 Transmit Buffer
      UCB0TXBUF : aliased MSP430_SVD.Byte;
      --  USCI B0 I2C Own Address
      UCB0I2COA : aliased UCB0I2COA_Register;
      --  USCI B0 I2C Slave Address
      UCB0I2CSA : aliased UCB0I2CSA_Register;
   end record
     with Volatile;

   for USCI_B0_I2C_MODE_Peripheral use record
      UCB0CTL0  at 16#0# range 0 .. 7;
      UCB0CTL1  at 16#1# range 0 .. 7;
      UCB0BR0   at 16#2# range 0 .. 7;
      UCB0BR1   at 16#3# range 0 .. 7;
      UCB0I2CIE at 16#4# range 0 .. 7;
      UCB0STAT  at 16#5# range 0 .. 7;
      UCB0RXBUF at 16#6# range 0 .. 7;
      UCB0TXBUF at 16#7# range 0 .. 7;
      UCB0I2COA at 16#B0# range 0 .. 15;
      UCB0I2CSA at 16#B2# range 0 .. 15;
   end record;

   --  USCI_B0 I2C Mode
   USCI_B0_I2C_MODE_Periph : aliased USCI_B0_I2C_MODE_Peripheral
     with Import, Address => USCI_B0_I2C_MODE_Base;

end MSP430_SVD.USCI_B0_I2C_MODE;
