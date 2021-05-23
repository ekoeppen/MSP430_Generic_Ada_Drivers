with MSP430_SVD; use MSP430_SVD;
with MSPGD.Board; use MSPGD.Board;
with MSPGD.GPIO; use MSPGD.GPIO;
with MSPGD.GPIO.Pin;
with Drivers.Text_IO;
with Drivers.NRF24;

procedure Main is

   pragma Preelaborate;

   package CE is new MSPGD.GPIO.Pin (Port => 2, Pin => 0, Direction => Output);
   package IRQ is new MSPGD.GPIO.Pin (Port => 2, Pin => 2);
   package Text_IO is new Drivers.Text_IO (USART => UART);
   package Radio is new Drivers.NRF24 (SPI => SPI, Chip_Select => SSEL, Chip_Enable => CE, IRQ => IRQ, Clock => Clock);

   procedure Print_Registers is new Radio.Print_Registers(Put_Line => Text_IO.Put_Line);

   Broadcast_Address : constant Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
   procedure TX_Test is
      TX_Data           : constant Radio.Packet_Type := (16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#);
      Input : String (1 .. 16);
      Len : Natural;
   begin
      Radio.TX_Mode;
      Radio.TX (TX_Data);
      Print_Registers;
      loop
         Text_IO.Get_Line (Input, Len);
         Radio.TX (TX_Data);
      end loop;
   end TX_Test;

begin
   Init;
   LED_RED.Init;
   LED_RED.Clear;
   SPI.Init;
   SCLK.Init;
   MISO.Init;
   MOSI.Init;
   SSEL.Init;
   CE.Init;
   IRQ.Init;
   SSEL.Set;
   Text_IO.Put_Line ("NRF24 sender starting...");
   Radio.Init;
   Radio.Set_Channel (70);
   Radio.Set_TX_Address (Broadcast_Address);
   Print_Registers;
   TX_Test;
end Main;
