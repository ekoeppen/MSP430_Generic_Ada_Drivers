with System;
with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;
with Ada.Unchecked_Conversion;

package body Startup is

   WDTCTL : Unsigned_16 with Import, Address => System'To_Address (16#0120#);

   procedure Ada_Init with Import => True, Convention => C, External_Name => "adainit";
   procedure Ada_Main with Import => True, Convention => C, External_Name => "_ada_main";
   procedure Default_Handler with Export => True, External_Name => "Default_Handler";
      pragma Machine_Attribute (Entity => Default_Handler, Attribute_Name => "interrupt");

   procedure Default_Handler is
   begin
      Asm ("bic.b #0xF8, 0(SP)", Volatile => True);
   end Default_Handler;

   procedure Reset_Handler is
      Sdata : Storage_Element
        with Import, Convention => Asm, External_Name => "__data_start";
      Edata : Storage_Element
        with Import, Convention => Asm, External_Name => "__data_end";
      Sbss : Storage_Element
        with Import, Convention => Asm, External_Name => "__bss_start";
      Ebss : Storage_Element
        with Import, Convention => Asm, External_Name => "__bss_end";

      Data_Size : constant Storage_Offset := Edata'Address - Sdata'Address;

      --  Index from 1 so as to avoid subtracting 1 from the size
      Data_In_Flash : Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "__data_load";

      Data_In_Sram : Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "__data_start";

      Bss_Size : constant Storage_Offset := Ebss'Address - Sbss'Address;

      Bss : Storage_Array (1 .. Bss_Size)
        with Import, Convention => Ada, External_Name => "__bss_start";
   begin
      Asm ("mov #__stack_end, sp", Volatile => True);
      WDTCTL := 16#5A80#;
      --  Data_In_Sram := Data_In_Flash;
      --  Bss := (others => 0);

      Ada_Init;
      Ada_Main;
   end Reset_Handler;

   Vectors : constant array (0 .. 15) of System.Address := (
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Reset_Handler'Address)
      with Export => True;
   pragma Linker_Section (Vectors, ".vectors");

end Startup;
