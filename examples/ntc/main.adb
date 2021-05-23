with MSP430_SVD; use MSP430_SVD;
with MSPGD.Board; use MSPGD.Board;
with MSPGD.Clock; use MSPGD.Clock;
with MSPGD.Clock.Source;
with MSPGD.GPIO; use MSPGD.GPIO;
with MSPGD.GPIO.Pin;
with Drivers.Text_IO;
with Drivers.NTC;
with Interfaces; use Interfaces;

procedure Main is

   pragma Preelaborate;

   package Text_IO is new Drivers.Text_IO (USART => UART);
   package Delay_Clock is new MSPGD.Clock.Source (Frequency => 12000, Input => VLO, Source => ACLK);
   package NTC is new Drivers.NTC;

   procedure NTC_Test is
      NTC_Value : Unsigned_32;
   begin
      loop
         LED.Set;
         NTC_Value := NTC.Value (Integer (Read_NTC));
         Text_IO.Put ("NTC Value: ");
         Text_IO.Put_Hex (NTC_Value);
         Text_IO.New_Line;
         LED.Clear;
         Delay_Clock.Delay_Slow_Periods (1);
      end loop;
   end NTC_Test;

begin
   Init;
   Delay_Clock.Init;
   Text_IO.Put_Line ("NTC test ...");
   NTC_Test;
end Main;
