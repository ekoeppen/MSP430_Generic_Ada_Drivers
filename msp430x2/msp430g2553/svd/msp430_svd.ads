--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces;  use Interfaces;
with System;

package MSP430_SVD is
   pragma Preelaborate;

   ---------------
   -- Base type --
   ---------------

   type UInt32 is new Interfaces.Unsigned_32;
   type UInt16 is new Interfaces.Unsigned_16;
   type Byte is new Interfaces.Unsigned_8;
   type Bit is mod 2**1
     with Size => 1;
   type UInt2 is mod 2**2
     with Size => 2;
   type UInt3 is mod 2**3
     with Size => 3;
   type UInt4 is mod 2**4
     with Size => 4;
   type UInt5 is mod 2**5
     with Size => 5;
   type UInt6 is mod 2**6
     with Size => 6;
   type UInt7 is mod 2**7
     with Size => 7;
   type UInt8 is mod 2**8
     with Size => 8;
   type UInt9 is mod 2**9
     with Size => 9;
   type UInt10 is mod 2**10
     with Size => 10;
   type UInt11 is mod 2**11
     with Size => 11;
   type UInt12 is mod 2**12
     with Size => 12;
   type UInt13 is mod 2**13
     with Size => 13;
   type UInt14 is mod 2**14
     with Size => 14;
   type UInt15 is mod 2**15
     with Size => 15;
   type UInt17 is mod 2**17
     with Size => 17;
   type UInt18 is mod 2**18
     with Size => 18;
   type UInt19 is mod 2**19
     with Size => 19;
   type UInt20 is mod 2**20
     with Size => 20;
   type UInt21 is mod 2**21
     with Size => 21;
   type UInt22 is mod 2**22
     with Size => 22;
   type UInt23 is mod 2**23
     with Size => 23;
   type UInt24 is mod 2**24
     with Size => 24;
   type UInt25 is mod 2**25
     with Size => 25;
   type UInt26 is mod 2**26
     with Size => 26;
   type UInt27 is mod 2**27
     with Size => 27;
   type UInt28 is mod 2**28
     with Size => 28;
   type UInt29 is mod 2**29
     with Size => 29;
   type UInt30 is mod 2**30
     with Size => 30;
   type UInt31 is mod 2**31
     with Size => 31;

   --------------------
   -- Base addresses --
   --------------------

   SPECIAL_FUNCTION_Base : constant System.Address := System'To_Address (16#0#);
   PORT_3_4_Base : constant System.Address := System'To_Address (16#10#);
   PORT_1_2_Base : constant System.Address := System'To_Address (16#20#);
   ADC10_Base : constant System.Address := System'To_Address (16#48#);
   SYSTEM_CLOCK_Base : constant System.Address := System'To_Address (16#52#);
   COMPARATOR_A_Base : constant System.Address := System'To_Address (16#58#);
   USCI_A0_UART_MODE_Base : constant System.Address := System'To_Address (16#5C#);
   USCI_A0_SPI_MODE_Base : constant System.Address := System'To_Address (16#60#);
   USCI_B0_I2C_MODE_Base : constant System.Address := System'To_Address (16#68#);
   USCI_B0_SPI_MODE_Base : constant System.Address := System'To_Address (16#68#);
   TLV_CALIBRATION_DATA_Base : constant System.Address := System'To_Address (16#10C0#);
   CALIBRATION_DATA_Base : constant System.Address := System'To_Address (16#10F8#);
   TIMER_1_A3_Base : constant System.Address := System'To_Address (16#11E#);
   WATCHDOG_TIMER_Base : constant System.Address := System'To_Address (16#120#);
   FLASH_Base : constant System.Address := System'To_Address (16#128#);
   TIMER_0_A3_Base : constant System.Address := System'To_Address (16#12E#);
   INTERRUPTS_Base : constant System.Address := System'To_Address (16#FFE0#);

end MSP430_SVD;
