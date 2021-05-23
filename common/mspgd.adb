with System.Machine_Code; use System.Machine_Code;

package body MSPGD is

   procedure Standby is
   begin
      Asm ("bis.b #0xD8, SR", Volatile => True);
   end Standby;

   procedure Stop is
   begin
      Asm ("bis.b #0xF8, SR", Volatile => True);
   end Stop;

   procedure Reset is
   begin
      Asm ("mov.b #0, &0x0121", Volatile => True);
   end Reset;

end MSPGD;
