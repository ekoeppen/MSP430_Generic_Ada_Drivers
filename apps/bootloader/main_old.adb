with System.Machine_Code; use System.Machine_Code;
with System.Storage_Elements; use System.Storage_Elements;
with System; use System;
with Interfaces; use Interfaces;
with MSPGD.Board; use MSPGD.Board;
with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.FLASH; use MSP430_SVD.FLASH;
with MSP430_SVD.SYSTEM_CLOCK; use MSP430_SVD.SYSTEM_CLOCK;

procedure Main is

   pragma Preelaborate;

   Flash_Start : Unsigned_16
      with Import, External_Name => "__flash_start";
   Flash_Size : Unsigned_16
      with Import, External_Name => "__flash_size";
   Info_Start : Unsigned_16
      with Import, External_Name => "__info_start";
   Info_Size : Unsigned_16
      with Import, External_Name => "__info_size";

   Flash_Segment_Size : constant Unsigned_16 := 512;
   Info_Segment_Size : constant Unsigned_16 := 64;
   type Flash_Memory_Range is new Unsigned_16 range Flash_Start .. Flash_Start + Flash_Size - 2;
   type Info_Memory_Range is new Unsigned_16 range Info_Start .. Info_Start + Info_Size - 2;
   type Flash_Segment_Range is new Unsigned_16 range 1 .. Flash_Size / Flash_Segment_Size;

   Flash_Memory : array (Flash_Memory_Range) of Unsigned_8
      with Address => System'To_Address (Flash_Start);
   Info_Memory : array (Info_Memory_Range) of Unsigned_8
      with Address => System'To_Address (Info_Start);

   Line : array (Unsigned_16 range 0 .. 47) of Unsigned_8;
   Write_Addr : Flash_Memory_Range;
   Count : Unsigned_8;

   XON : constant Byte := 17;
   XOFF : constant Byte := 19;

   function "+" (Addr : Flash_Memory_Range; Offset : Unsigned_16) return Flash_Memory_Range is
   begin
      return Flash_Memory_Range (Unsigned_16 (Addr) + Offset);
   end "+";

   function Nibble (N : Unsigned_8) return Unsigned_8 is
   begin
      return (if N >= 65 then N - 65 + 10 else N - 48);
   end Nibble;

   function From_Hex (I : Unsigned_16) return Unsigned_8 is
   begin
      return 16 * Nibble (Line (I)) + Nibble (Line (I + 1));
   end From_Hex;

   procedure Unlock_Flash is
   begin
      FLASH_Periph.FCTL3 := (FWKEY => 16#A5#, LOCK => 0, others => 0);
   end Unlock_Flash;

   procedure Lock_Flash is
   begin
      FLASH_Periph.FCTL1 := (FWKEY => 16#A5#, Reserved_3_5 => 0, others => 0);
      FLASH_Periph.FCTL3 := (FWKEY => 16#A5#, LOCK => 1, others => 0);
   end Lock_Flash;

   procedure Erase_Segment (Addr : Flash_Memory_Range) is
   begin
      Unlock_Flash;
      FLASH_Periph.FCTL1 := (FWKEY => 16#A5#, Reserved_3_5 => 0, Erase => 1, others => 0);
      Flash_Memory (Addr) := 0;
      Lock_Flash;
   end Erase_Segment;

   procedure Erase_Flash is
      Addr : Flash_Memory_Range := Flash_Memory_Range (Flash_Start);
      R_Low : Unsigned_8 := Flash_Memory (16#FFFE#);
      R_High : Unsigned_8 := Flash_Memory (16#FFFF#);
   begin
      Erase_Segment (16#FFE0#);
      while Addr'Valid loop
         Erase_Segment (Addr);
         Addr := Addr + Flash_Segment_Size;
      end loop;
      Flash_Memory (16#FFFE#) := R_Low;
      Flash_Memory (16#FFFF#) := R_High;
   end Erase_Flash;

   procedure Write_Flash is
   begin
      Unlock_Flash;
      FLASH_Periph.FCTL1 := (FWKEY => 16#A5#, Reserved_3_5 => 0, WRT => 1, others => 0);
      for I in Unsigned_8 range 0 .. Count loop
         Flash_Memory (Write_Addr) := From_Hex (Unsigned_16 (I) * 2);
         Write_Addr := Write_Addr + Unsigned_16 (1);
      end loop;
      Lock_Flash;
   end Write_Flash;

   procedure Reset is
   begin
      UART.Transmit (XON);
      FLASH_Periph.FCTL1 := (FWKEY => 16#00#, Reserved_3_5 => 0, WRT => 0, others => 0);
   end Reset;

   procedure Read_Line is
      Record_Type : Unsigned_8;
   begin
      UART.Transmit (XON);
      for I in Line'Range loop
         Line (I) := Unsigned_8 (UART.Receive);
         exit when Line (I) = 10;
      end loop;
      UART.Transmit (XOFF);
      Count := From_Hex (1);
      Write_Addr := Flash_Memory_Range (Unsigned_16 (From_Hex (3)) * 256 + Unsigned_16 (From_Hex (5)));
      Record_Type := From_Hex (7);
      case Record_Type is
         when 16#00# => Write_Flash;
         when 16#01# => Reset;
         when 16#80# => Erase_Flash;
         when 16#81# => Erase_Segment (Write_Addr);
         when others => null;
      end case;
   end Read_Line;

   procedure Init is
      CALDCO_8MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FC#);
      CALBC1_8MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FD#);
   begin
      BUTTON.Init;
      SYSTEM_CLOCK_Periph.DCOCTL.MOD_k.Val := 0;
      SYSTEM_CLOCK_Periph.DCOCTL.DCO.Val := 0;
      SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_8MHz;
      SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_8MHz;
      RX.Init;
      TX.Init;
      UART.Init;
      FLASH_Periph.FCTL2 := (FWKEY => 16#A5#, FSSEL => Fssel_1, FN => 20);
   end Init;

begin
   Init;
   UART.Transmit (Character'Pos ('!'));
   loop
      Read_Line;
   end loop;

end Main;
