package body Memory is

   function "+" (Addr : Flash_Memory_Range; Offset : Unsigned_16) return Flash_Memory_Range is
   begin
      return Flash_Memory_Range (Unsigned_16 (Addr) + Offset);
   end "+";

end Memory;
