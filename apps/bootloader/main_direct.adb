with System.Machine_Code; use System.Machine_Code;
with System.Storage_Elements; use System.Storage_Elements;
with System.Address_To_Access_Conversions;
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

   Flash_Segment_Size : constant Unsigned_16 := 512;

   type Flash_Memory_Type is array (Unsigned_16 range 0 .. 65535) of Unsigned_8;
   type Flash_Memory_Pointer is access all Flash_Memory_Type;
   package Convert is new System.Address_To_Access_Conversions (Flash_Memory_Type);
   Flash_Memory : constant Convert.Object_Pointer := Convert.To_Pointer (System'To_Address (0));

   Line : array (Unsigned_16 range 0 .. 47) of Unsigned_8;
   Write_Addr : Unsigned_16;
   Count : Unsigned_8;

   XON : constant Byte := 17;
   XOFF : constant Byte := 19;

   FCTL1 : Unsigned_16 with Import, Address => System'To_Address (16#0128#);
   FCTL2 : Unsigned_16 with Import, Address => System'To_Address (16#012A#);
   FCTL3 : Unsigned_16 with Import, Address => System'To_Address (16#012C#);

   function Nibble (N : Unsigned_8) return Unsigned_8 is
   begin
      return (if N >= 65 then N - 65 + 10 else N - 48);
   end Nibble;

   function From_Hex (I : Unsigned_16) return Unsigned_8 is
   begin
      return 16 * Nibble (Line (I)) + Nibble (Line (I + 1));
   end From_Hex;

   procedure Erase_Flash is
      Addr : Unsigned_16 := Flash_Start;
      R_Low : Unsigned_8 := Flash_Memory (65534);
      R_High : Unsigned_8 := Flash_Memory (65535);
   begin
      FCTL3 := 16#A500#;
      FCTL1 := 16#A502#;
      Flash_Memory (65534) := 0;
      while Addr <= 65535 loop
         if Addr /= 16#FA00# then Flash_Memory (Addr) := 0; end if;
         Addr := Addr + Flash_Segment_Size;
      end loop;
      Flash_Memory (65534) := R_Low;
      Flash_Memory (65535) := R_High;
      FCTL1 := 16#A500#;
      FCTL3 := 16#A510#;
   end Erase_Flash;

   procedure Write_Flash is
   begin
      FCTL3 := 16#A500#;
      FCTL1 := 16#A540#;
      for I in Unsigned_8 range 0 .. Count loop
         Flash_Memory (Write_Addr) := From_Hex (Unsigned_16 (I) * 2);
         Write_Addr := Write_Addr + Unsigned_16 (1);
      end loop;
      FCTL1 := 16#A500#;
      FCTL3 := 16#A510#;
   end Write_Flash;

   procedure Reset is
   begin
      UART.Transmit (XON);
      FCTL1 := 16#0000#;
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
      Write_Addr := (Unsigned_16 (From_Hex (3)) * 256 + Unsigned_16 (From_Hex (5)));
      Record_Type := From_Hex (7);
      case Record_Type is
         when 16#00# => Write_Flash;
         when 16#01# => Reset;
         when 16#80# => Erase_Flash;
         when others => null;
      end case;
   end Read_Line;

   procedure Init is
      CALDCO_8MHz : DCOCTL_Register with Import, Address => System'To_Address (16#10FC#);
      CALBC1_8MHz : BCSCTL1_Register with Import, Address => System'To_Address (16#10FD#);
   begin
      BUTTON.Init;
      if BUTTON.Is_Set then
         null;
      end if;
      --  SYSTEM_CLOCK_Periph.DCOCTL.MOD_k.Val := 0;
      --  SYSTEM_CLOCK_Periph.DCOCTL.DCO.Val := 0;
      SYSTEM_CLOCK_Periph.BCSCTL1 := CALBC1_8MHz;
      SYSTEM_CLOCK_Periph.DCOCTL := CALDCO_8MHz;
      RX.Init;
      TX.Init;
      UART.Init;
      FCTL2 := 16#A554#;
      --  FLASH_Periph.FCTL2 := (FWKEY => 16#A5#, FSSEL => Fssel_1, FN => 20);
   end Init;

begin
   Init;
   loop
      Read_Line;
   end loop;

end Main;
