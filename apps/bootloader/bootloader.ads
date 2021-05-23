package Bootloader is

   pragma Preelaborate;

   procedure Erase;
   procedure Start;
      pragma Machine_Attribute (Start, "naked");

end Bootloader;
