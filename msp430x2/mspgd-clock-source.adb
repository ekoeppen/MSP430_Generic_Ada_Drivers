with System.Machine_Code; use System.Machine_Code;
with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.SYSTEM_CLOCK; use MSP430_SVD.SYSTEM_CLOCK;
with MSP430_SVD.WATCHDOG_TIMER; use MSP430_SVD.WATCHDOG_TIMER;
with MSP430_SVD.SPECIAL_FUNCTION; use MSP430_SVD.SPECIAL_FUNCTION;

package body MSPGD.Clock.Source is

   procedure Init_DCO is
      CALDCO_1MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FE#);
      CALBC1_1MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FF#);

      CALDCO_8MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FC#);
      CALBC1_8MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FD#);

      CALDCO_12MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FA#);
      CALBC1_12MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FB#);

      CALDCO_16MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10F8#);
      CALBC1_16MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10F9#);
   begin
      case Frequency is
         when 1_000_000 =>
            SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_1MHz;
            SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_1MHz;
         when 8_000_000 =>
            SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_8MHz;
            SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_8MHz;
         when 12_000_000 =>
            SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_12MHz;
            SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_12MHz;
         when 16_000_000 =>
            SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_16MHz;
            SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_16MHz;
         when others => null;
      end case;
   end Init_DCO;

   procedure Init_ACLK is
      Divider : Unsigned_32 := 0;
   begin
      case Input is
         when LFXT1 =>
            SYSTEM_CLOCK_Periph.BCSCTL3.LFXT1S := Lfxt1S_0;
            Divider := (32768 / Frequency) - 1;
         when VLO =>
            SYSTEM_CLOCK_Periph.BCSCTL3.LFXT1S := Lfxt1S_2;
            Divider := (12000 / Frequency) - 1;
         when others => null;
      end case;
      SYSTEM_CLOCK_Periph.BCSCTL1.DIVA := (
         if Divider > 4 then Diva_3
         elsif Divider > 2 then Diva_2
         elsif Divider > 1 then Diva_1
         else Diva_0);
   end Init_ACLK;

   procedure Init_SMCLK is
   begin
      case Input is
         when DCO => Init_DCO;
         when others => null;
      end case;
   end Init_SMCLK;

   procedure Init_MCLK is
   begin
      case Input is
         when DCO => Init_DCO;
         when others => null;
      end case;
   end Init_MCLK;

   procedure Init is
   begin
      case Source is
         when ACLK => Init_ACLK;
         when SMCLK => Init_SMCLK;
         when MCLK => Init_MCLK;
      end case;
   end Init;

   procedure Delay_Cycles (Ticks : Unsigned_64);
      pragma Import (Intrinsic, delay_cycles, "__delay_cycles");

   procedure Delay_us (us : Natural) is
   begin
      for I in Natural range 0 .. us loop
         Delay_Cycles (4);
      end loop;
   end Delay_us;

   procedure Delay_ms (ms : Natural) is
      Period_1ms : Unsigned_32 := Frequency / 1000;
      Divider_1ms : UInt2 := (
         if Period_1ms > 8192 then 0
         elsif Period_1ms > 512 then 1
         elsif Period_1ms > 64 then 2
         else 3);
      Actual_Period : Unsigned_32 := Period_1ms * Unsigned_32 (Divider_1ms);
   begin
      WATCHDOG_TIMER_Periph.WDTCTL := (
         WDTPW => 16#5A#,
         WDTTMSEL => 1,
         WDTIS => Divider_1ms,
         WDTSSEL => (if Source = ACLK then 1 else 0),
         WDTCNTCL => 1,
         others => 0);
      SPECIAL_FUNCTION_Periph.IE1.WDTIE := 1;
      for I in Natural range 1 .. ms loop
         if Source = ACLK then
            Standby;
         else
            while SPECIAL_FUNCTION_Periph.IFG1.WDTIFG = 0 loop null; end loop;
         end if;
         SPECIAL_FUNCTION_Periph.IFG1.WDTIFG := 0;
      end loop;
   end Delay_ms;

   procedure Delay_s (s : Natural) is
      Divider_1s : UInt2 := (
         if Frequency > 8192 then 0
         elsif Frequency > 512 then 1
         elsif Frequency > 64 then 2
         else 3);
      Actual_Period : Unsigned_32 := Frequency * Unsigned_32 (Divider_1s);
   begin
      WATCHDOG_TIMER_Periph.WDTCTL := (
         WDTPW => 16#5A#,
         WDTTMSEL => 1,
         WDTIS => Divider_1s,
         WDTSSEL => (if Source = ACLK then 1 else 0),
         WDTCNTCL => 1,
         others => 0);
      SPECIAL_FUNCTION_Periph.IE1.WDTIE := 1;
      for I in Natural range 1 .. s loop
         if Source = ACLK then
            Standby;
         else
            while SPECIAL_FUNCTION_Periph.IFG1.WDTIFG = 0 loop null; end loop;
         end if;
         SPECIAL_FUNCTION_Periph.IFG1.WDTIFG := 0;
      end loop;
   end Delay_s;

   procedure Delay_Slow_Periods (P : Unsigned_16) is
   begin
      WATCHDOG_TIMER_Periph.WDTCTL := (
         WDTPW => 16#5A#,
         WDTTMSEL => 1,
         WDTIS => 0,
         WDTSSEL => (if Source = ACLK then 1 else 0),
         WDTCNTCL => 1,
         others => 0);
      SPECIAL_FUNCTION_Periph.IE1.WDTIE := 1;
      for I in Unsigned_16 range 1 ..P loop
         if Source = ACLK then
            Standby;
         else
            while SPECIAL_FUNCTION_Periph.IFG1.WDTIFG = 0 loop null; end loop;
         end if;
         SPECIAL_FUNCTION_Periph.IFG1.WDTIFG := 0;
      end loop;
   end Delay_Slow_Periods;

   function Millisecond_Counter return Unsigned_32 is
   begin
      return 0;
   end Millisecond_Counter;

   function Maximum_Delay_ms return Unsigned_16 is
   begin
      return Unsigned_16 (Frequency / Unsigned_32 (32768));
   end Maximum_Delay_ms;

end MSPGD.Clock.Source;
