with System;

package body Flash is

   FCTL1 : Unsigned_16 with Import, Address => System'To_Address (16#0128#);
   FCTL2 : Unsigned_16 with Import, Address => System'To_Address (16#012A#);
   FCTL3 : Unsigned_16 with Import, Address => System'To_Address (16#012C#);

   Flash_Memory : array (Unsigned_16 range 0 .. 32767) of Unsigned_16
      with Import, Address => System'To_Address (0);

   procedure Init is
   begin
      FCTL2 := 16#A553#;
   end Init;

   procedure Unlock is
   begin
      FCTL3 := 16#A500#;
   end Unlock;
      pragma Linker_Section (Unlock, ".text.lower");

   procedure Lock is
   begin
      FCTL1 := 16#A500#;
      FCTL3 := 16#A510#;
   end Lock;
      pragma Linker_Section (Lock, ".text.lower");

   procedure Enable_Erase is
   begin
      FCTL1 := 16#A502#;
   end Enable_Erase;
      pragma Linker_Section (Enable_Erase, ".text.lower");


   procedure Erase (Addr : Unsigned_16) is
   begin
      Enable_Erase;
      Write (Addr, 0);
   end Erase;
      pragma Linker_Section (Enable_Erase, ".text.lower");

   procedure Enable_Write is
   begin
      FCTL1 := 16#A540#;
   end Enable_Write;
      pragma Linker_Section (Enable_Write, ".text.lower");

   procedure Write (Addr : Unsigned_16; Value : Unsigned_16) is
   begin
      Flash_Memory (Addr / 2) := Value;
   end Write;
      pragma Linker_Section (Write, ".text.lower");

   function Read (Addr : Unsigned_16) return Unsigned_16 is
   begin
      return Flash_Memory (Addr / 2);
   end Read;
      pragma Linker_Section (Read, ".text.lower");

   procedure Wait_Until_Ready is
   begin
      while (FCTL3 and 2 ** 3) = 0 loop null; end loop;
   end Wait_Until_Ready;
      pragma Linker_Section (Read, ".text.lower");

end Flash;
