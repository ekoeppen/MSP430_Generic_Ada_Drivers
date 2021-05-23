with HAL;
with Interfaces; use Interfaces;

generic

   with package USART is new HAL.USART (<>);

package Drivers.Text_IO is

   pragma Preelaborate;

   procedure Put (C : Character);
   procedure Put (S : String);
   procedure Put_Line (S : String);
   procedure Put_Integer (N : Integer; Width : Natural := 0);
   procedure Put_Hex (N : Unsigned_32; Width : Natural := 0);
   procedure New_Line;
   procedure Get_Line (S : out String; Count : out Natural);

end Drivers.Text_IO;
