with System.Machine_Code; use System.Machine_Code;
with System; use System;
with Interfaces; use Interfaces;
with MSP430_SVD; use MSP430_SVD;
with Flash;
with Board;

package body Bootloader is

   Line : array (Unsigned_16 range 0 .. 47) of Unsigned_8;
   Write_Addr : Unsigned_16;
   Count : Unsigned_8;

   User_Vector_Address : constant Unsigned_16 := 16#FFBE#;
   Reset_Vector_Address : constant Unsigned_16 := 16#FFFE#;
   Bootloader_Address : constant Unsigned_16 := 16#FC00#;
   Vector_Segment_Address : constant Unsigned_16 := 16#FE00#;
   Flash_Segment_Size : constant Unsigned_16 := 512;

   package UART renames Board.UART;

   procedure Erase is
      Addr : Unsigned_16 := 16#C000#;
      Saved_Vector : Unsigned_16;
      Saved_Code : array (Unsigned_16 range 0 .. 127) of Unsigned_16;
   begin
      for I in Saved_Code'Range loop
         Saved_Code (I) := Flash.Read (I * 2 + Vector_Segment_Address);
      end loop;
      Saved_Vector := Flash.Read (Reset_Vector_Address);
      Flash.Unlock;
      Flash.Erase (Vector_Segment_Address);
      while Addr < Bootloader_Address loop
         Flash.Erase (Addr);
         Addr := Addr + Flash_Segment_Size;
      end loop;
      Flash.Enable_Write;
      Flash.Write (Reset_Vector_Address, Saved_Vector);
      for I in Saved_Code'Range loop
         Flash.Write (I * 2 + Vector_Segment_Address, Saved_Code (I));
      end loop;
      Flash.Lock;
   end Erase;
      pragma Linker_Section (Erase, ".text.lower");

   function Nibble (N : Unsigned_8) return Unsigned_8 is
   begin
      return (if N >= 65 then N - 65 + 10 else N - 48);
   end Nibble;

   function From_Hex (I : Unsigned_16) return Unsigned_8 is
   begin
      return 16 * Nibble (Line (I)) + Nibble (Line (I + 1));
   end From_Hex;

   procedure Write is
      Value : Unsigned_16;
      J : Unsigned_16;
   begin
      Flash.Unlock;
      Flash.Enable_Write;
      J := 9;
      for I in Unsigned_16 range 1 .. Unsigned_16 (Count) / 2 loop
         Value := Unsigned_16 (From_Hex (J)) +
            256 * Unsigned_16 (From_Hex (J + 2));
         if Write_Addr = Reset_Vector_Address then
            Flash.Write (User_Vector_Address, Value);
         else
            Flash.Write (Write_Addr, Value);
         end if;
         J := J + 4;
         Write_Addr := Write_Addr + Unsigned_16 (2);
      end loop;
      Flash.Lock;
   end Write;

   procedure Read_Lines is
      Record_Type : Unsigned_8;
      XON : constant Byte := 17;
      XOFF : constant Byte := 19;
   begin
      loop
         UART.Transmit (XON);
         for I in Line'Range loop
            Line (I) := Unsigned_8 (UART.Receive);
            exit when Line (I) = 10;
         end loop;
         UART.Transmit (XOFF);
         Count := From_Hex (1);
         Write_Addr := Unsigned_16 (From_Hex (3)) * 256 + Unsigned_16 (From_Hex (5));
         Record_Type := From_Hex (7);
         case Record_Type is
            when 16#00# => Write;
            when 16#80# => Flash.Erase (Write_Addr);
            when others => null;
         end case;
      end loop;
   end Read_Lines;

   procedure Start is
   begin
      Board.Init;
      UART.Transmit (Character'Pos ('?'));
      for J in 1 .. 12 loop
         for I in 0 .. Unsigned_16'Last loop
            if UART.Data_Available and then UART.Receive = Character'Pos ('f') then
               while UART.Data_Available loop UART.Transmit (UART.Receive); end loop;
               Flash.Init;
               Erase;
               Read_Lines;
            end if;
         end loop;
      end loop;
      if Flash.Read (User_Vector_Address) /= 16#FFFF# then
         Asm ("mov #0xffbe, r8", Volatile => True);
         Asm ("mov.b #0x60, &0x56", Volatile => True);
         Asm ("mov.b #0x87, &0x57", Volatile => True);
         Asm ("mov #0x5a00, &0x120", Volatile => True);
         Asm ("br 0(r8)", Volatile => True);
       end if;
   end Start;

   procedure Start_1 is
   begin
      Board.Init;
      Flash.Init;
      Erase;
      Read_Lines;
      loop null; end loop;
   end Start_1;

end Bootloader;
