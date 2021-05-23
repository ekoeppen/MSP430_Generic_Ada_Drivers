with System; use System;
with Interfaces; use Interfaces;

package Memory is

   Flash_Start : Unsigned_16
     with Import, Convention => Asm, External_Name => "__flash_start";
   Flash_Size : Unsigned_16
     with Import, Convention => Asm, External_Name => "__flash_size";
   Info_Start : Unsigned_16
     with Import, Convention => Asm, External_Name => "__info_start";
   Info_Size : Unsigned_16
     with Import, Convention => Asm, External_Name => "__info_size";

   Flash_Segment_Size : constant Unsigned_16 := 512;
   Info_Segment_Size : constant Unsigned_16 := 64;

   type Flash_Memory_Range is new Unsigned_16 range Flash_Start .. Flash_Start + Flash_Size - 2;
   type Info_Memory_Range is new Unsigned_16 range Info_Start .. Info_Start + Info_Size - 2;
   type Flash_Segment_Range is new Unsigned_16 range 1 .. Flash_Size / Flash_Segment_Size;

   Flash_Memory : array (Flash_Memory_Range) of Unsigned_8
      with Address => System'To_Address (Flash_Start);
   Info_Memory : array (Info_Memory_Range) of Unsigned_8
      with Address => System'To_Address (Info_Start);

   function "+" (Addr : Flash_Memory_Range; Offset : Unsigned_16) return Flash_Memory_Range;

end Memory;
