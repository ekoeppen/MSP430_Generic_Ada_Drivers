with System;
with Interfaces; use Interfaces;
with System.Machine_Code; use System.Machine_Code;

package body Startup is

   WDTCTL : Unsigned_16 with Import, Address => System'To_Address (16#0120#);

   procedure Ada_Init with Import => True, Convention => C, External_Name => "adainit";
   procedure Ada_Main with Import => True, Convention => C, External_Name => "_ada_main";

   procedure Reset_Handler is
   begin
      Asm ("mov #__stack_end, sp", Volatile => True);
      WDTCTL := 16#5A80#;
      Ada_Init;
      Ada_Main;
   end Reset_Handler;

   Vectors : constant array (0 .. 15) of System.Address := (
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      System'To_Address (16#FFFF#),
      Reset_Handler'Address)
      with Export => True;
   pragma Linker_Section (Vectors, ".vectors");

end Startup;
