with Drivers.Text_IO;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);
   AES_Enabled : Boolean := False;
   Packet_Size : Unsigned_8 := 64;
   Frequency : Unsigned_32;

package Drivers.RFM69 is

   pragma Preelaborate;

   subtype Packet_Size_Type is Unsigned_8 range 1 .. Packet_Size;
   subtype Address_Type is Unsigned_8;
   type Sync_Word_Type is array (Positive range <>) of Unsigned_8;
   type Packet_Type is array (Packet_Size_Type) of Unsigned_8;
   type AES_Key_Type is array (Positive range 1 .. 16) of Unsigned_8;
   type Raw_Register_Array is array (0 .. 16#4D#) of Unsigned_8;
   subtype Output_Power_Type is Integer_8 range -18 .. 17;

   pragma Compile_Time_Error ((AES_Enabled and Packet_Size > 64), "Invalid packet size");

   procedure Init;
   procedure Set_Sync_Word (Sync_Word : Sync_Word_Type);
   procedure Set_Frequency (Frequency : Unsigned_32);
   procedure Set_Bitrate (Bitrate : Unsigned_32);
   procedure Set_Broadcast_Address (Address : Address_Type);
   procedure Set_RX_Address (Address : Address_Type);
   procedure Set_TX_Address (Address : Address_Type);
   procedure Set_Output_Power (Power : Output_Power_Type);
   procedure TX_Mode;
   procedure RX_Mode;
   procedure TX (Packet : Packet_Type);
   procedure TX (Packet : Packet_Type; Length : Unsigned_8);
   function RX_Available return Boolean;
   function TX_Complete return Boolean;
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type; Length : out Unsigned_8);
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   generic
      with procedure Put_Line (Line : in string);
   procedure Print_Registers;

end Drivers.RFM69;
