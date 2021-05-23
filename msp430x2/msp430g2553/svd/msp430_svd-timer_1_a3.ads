--  This spec has been automatically generated from msp430g2553.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  Timer1_A3
package MSP430_SVD.TIMER_1_A3 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Timer A mode control 1
   type TA1CTL_MC_Field is
     (--  Timer A mode control: 0 - Stop
      Mc_0,
      --  Timer A mode control: 1 - Up to CCR0
      Mc_1,
      --  Timer A mode control: 2 - Continous up
      Mc_2,
      --  Timer A mode control: 3 - Up/Down
      Mc_3)
     with Size => 2;
   for TA1CTL_MC_Field use
     (Mc_0 => 0,
      Mc_1 => 1,
      Mc_2 => 2,
      Mc_3 => 3);

   --  Timer A clock input divider 1
   type TA1CTL_ID_Field is
     (--  Timer A input divider: 0 - /1
      Id_0,
      --  Timer A input divider: 1 - /2
      Id_1,
      --  Timer A input divider: 2 - /4
      Id_2,
      --  Timer A input divider: 3 - /8
      Id_3)
     with Size => 2;
   for TA1CTL_ID_Field use
     (Id_0 => 0,
      Id_1 => 1,
      Id_2 => 2,
      Id_3 => 3);

   --  Timer A clock source select 1
   type TA1CTL_TASSEL_Field is
     (--  Timer A clock source select: 0 - TACLK
      Tassel_0,
      --  Timer A clock source select: 1 - ACLK
      Tassel_1,
      --  Timer A clock source select: 2 - SMCLK
      Tassel_2,
      --  Timer A clock source select: 3 - INCLK
      Tassel_3)
     with Size => 2;
   for TA1CTL_TASSEL_Field use
     (Tassel_0 => 0,
      Tassel_1 => 1,
      Tassel_2 => 2,
      Tassel_3 => 3);

   --  Timer1_A3 Control
   type TA1CTL_Register is record
      --  Timer A counter interrupt flag
      TAIFG          : MSP430_SVD.Bit := 16#0#;
      --  Timer A counter interrupt enable
      TAIE           : MSP430_SVD.Bit := 16#0#;
      --  Timer A counter clear
      TACLR          : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_3_3   : MSP430_SVD.Bit := 16#0#;
      --  Timer A mode control 1
      MC             : TA1CTL_MC_Field := MSP430_SVD.TIMER_1_A3.Mc_0;
      --  Timer A clock input divider 1
      ID             : TA1CTL_ID_Field := MSP430_SVD.TIMER_1_A3.Id_0;
      --  Timer A clock source select 1
      TASSEL         : TA1CTL_TASSEL_Field := MSP430_SVD.TIMER_1_A3.Tassel_0;
      --  unspecified
      Reserved_10_15 : MSP430_SVD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TA1CTL_Register use record
      TAIFG          at 0 range 0 .. 0;
      TAIE           at 0 range 1 .. 1;
      TACLR          at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      MC             at 0 range 4 .. 5;
      ID             at 0 range 6 .. 7;
      TASSEL         at 0 range 8 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  Output mode 2
   type TA1CCTL0_OUTMOD_Field is
     (--  PWM output mode: 0 - output only
      Outmod_0,
      --  PWM output mode: 1 - set
      Outmod_1,
      --  PWM output mode: 2 - PWM toggle/reset
      Outmod_2,
      --  PWM output mode: 3 - PWM set/reset
      Outmod_3,
      --  PWM output mode: 4 - toggle
      Outmod_4,
      --  PWM output mode: 5 - Reset
      Outmod_5,
      --  PWM output mode: 6 - PWM toggle/set
      Outmod_6,
      --  PWM output mode: 7 - PWM reset/set
      Outmod_7)
     with Size => 3;
   for TA1CCTL0_OUTMOD_Field use
     (Outmod_0 => 0,
      Outmod_1 => 1,
      Outmod_2 => 2,
      Outmod_3 => 3,
      Outmod_4 => 4,
      Outmod_5 => 5,
      Outmod_6 => 6,
      Outmod_7 => 7);

   --  Capture input select 1
   type TA1CCTL0_CCIS_Field is
     (--  Capture input select: 0 - CCIxA
      Ccis_0,
      --  Capture input select: 1 - CCIxB
      Ccis_1,
      --  Capture input select: 2 - GND
      Ccis_2,
      --  Capture input select: 3 - Vcc
      Ccis_3)
     with Size => 2;
   for TA1CCTL0_CCIS_Field use
     (Ccis_0 => 0,
      Ccis_1 => 1,
      Ccis_2 => 2,
      Ccis_3 => 3);

   --  Capture mode 1
   type TA1CCTL0_CM_Field is
     (--  Capture mode: 0 - disabled
      Cm_0,
      --  Capture mode: 1 - pos. edge
      Cm_1,
      --  Capture mode: 1 - neg. edge
      Cm_2,
      --  Capture mode: 1 - both edges
      Cm_3)
     with Size => 2;
   for TA1CCTL0_CM_Field use
     (Cm_0 => 0,
      Cm_1 => 1,
      Cm_2 => 2,
      Cm_3 => 3);

   --  Timer1_A3 Capture/Compare Control 0
   type TA1CCTL_Register is record
      --  Capture/compare interrupt flag
      CCIFG        : MSP430_SVD.Bit := 16#0#;
      --  Capture/compare overflow flag
      COV          : MSP430_SVD.Bit := 16#0#;
      --  PWM Output signal if output mode 0
      OUT_k        : MSP430_SVD.Bit := 16#0#;
      --  Capture input signal (read)
      CCI          : MSP430_SVD.Bit := 16#0#;
      --  Capture/compare interrupt enable
      CCIE         : MSP430_SVD.Bit := 16#0#;
      --  Output mode 2
      OUTMOD       : TA1CCTL0_OUTMOD_Field := MSP430_SVD.TIMER_1_A3.Outmod_0;
      --  Capture mode: 1 /Compare mode : 0
      CAP          : MSP430_SVD.Bit := 16#0#;
      --  unspecified
      Reserved_9_9 : MSP430_SVD.Bit := 16#0#;
      --  Latched capture signal (read)
      SCCI         : MSP430_SVD.Bit := 16#0#;
      --  Capture sychronize
      SCS          : MSP430_SVD.Bit := 16#0#;
      --  Capture input select 1
      CCIS         : TA1CCTL0_CCIS_Field := MSP430_SVD.TIMER_1_A3.Ccis_0;
      --  Capture mode 1
      CM           : TA1CCTL0_CM_Field := MSP430_SVD.TIMER_1_A3.Cm_0;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for TA1CCTL_Register use record
      CCIFG        at 0 range 0 .. 0;
      COV          at 0 range 1 .. 1;
      OUT_k        at 0 range 2 .. 2;
      CCI          at 0 range 3 .. 3;
      CCIE         at 0 range 4 .. 4;
      OUTMOD       at 0 range 5 .. 7;
      CAP          at 0 range 8 .. 8;
      Reserved_9_9 at 0 range 9 .. 9;
      SCCI         at 0 range 10 .. 10;
      SCS          at 0 range 11 .. 11;
      CCIS         at 0 range 12 .. 13;
      CM           at 0 range 14 .. 15;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Timer1_A3
   type TIMER_1_A3_Peripheral is record
      --  Timer1_A3 Interrupt Vector Word
      TA1IV    : aliased MSP430_SVD.UInt16;
      --  Timer1_A3 Control
      TA1CTL   : aliased TA1CTL_Register;
      --  Timer1_A3 Capture/Compare Control 0
      TA1CCTL0 : aliased TA1CCTL_Register;
      --  Timer1_A3 Capture/Compare Control 1
      TA1CCTL1 : aliased TA1CCTL_Register;
      --  Timer1_A3 Capture/Compare Control 2
      TA1CCTL2 : aliased TA1CCTL_Register;
      --  Timer1_A3 Counter Register
      TA1R     : aliased MSP430_SVD.UInt16;
      --  Timer1_A3 Capture/Compare 0
      TA1CCR0  : aliased MSP430_SVD.UInt16;
      --  Timer1_A3 Capture/Compare 1
      TA1CCR1  : aliased MSP430_SVD.UInt16;
      --  Timer1_A3 Capture/Compare 2
      TA1CCR2  : aliased MSP430_SVD.UInt16;
   end record
     with Volatile;

   for TIMER_1_A3_Peripheral use record
      TA1IV    at 16#0# range 0 .. 15;
      TA1CTL   at 16#62# range 0 .. 15;
      TA1CCTL0 at 16#64# range 0 .. 15;
      TA1CCTL1 at 16#66# range 0 .. 15;
      TA1CCTL2 at 16#68# range 0 .. 15;
      TA1R     at 16#72# range 0 .. 15;
      TA1CCR0  at 16#74# range 0 .. 15;
      TA1CCR1  at 16#76# range 0 .. 15;
      TA1CCR2  at 16#78# range 0 .. 15;
   end record;

   --  Timer1_A3
   TIMER_1_A3_Periph : aliased TIMER_1_A3_Peripheral
     with Import, Address => TIMER_1_A3_Base;

end MSP430_SVD.TIMER_1_A3;
