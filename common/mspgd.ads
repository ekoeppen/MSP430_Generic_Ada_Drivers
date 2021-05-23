with Interfaces; use Interfaces;

package MSPGD is

   pragma Preelaborate;

   type Buffer_Type is array (Integer range <>) of Unsigned_8;

   procedure Standby with Inline_Always;
   procedure Stop with Inline_Always;
   procedure Reset with Inline_Always;

end MSPGD;
