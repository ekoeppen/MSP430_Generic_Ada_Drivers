with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package Chip_Enable is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);
   with package Clock is new HAL.Clock (<>);

package Drivers.NRF24 is

   pragma Preelaborate;

   type Raw_Register_Array is array (0 .. 16#1D#) of Unsigned_8;
   subtype Channel_Type is Unsigned_8 range 0 .. 127;
   type Address_Type is array (1 .. 5) of Unsigned_8;
   type Packet_Type is array (Positive range <>) of Unsigned_8;

   procedure Init;
   procedure Set_Channel (Channel : Channel_Type);
   procedure Set_RX_Address (Address : Address_Type);
   procedure Set_TX_Address (Address : Address_Type);
   procedure TX_Mode;
   procedure RX_Mode;
   procedure TX (Packet: Packet_Type);
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type);
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   generic
      with procedure Put_Line (Line: in string);
   procedure Print_Registers;

end Drivers.NRF24;
