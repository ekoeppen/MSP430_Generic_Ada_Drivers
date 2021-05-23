with MSP430_SVD; use MSP430_SVD;
with MSPGD.Clock.Source;

generic

   Module : SPI_Module_Type;
   Speed: UInt32;
   Mode : SPI_Mode := Mode_0;
   with package Clock is new MSPGD.Clock.Source (<>);

package MSPGD.SPI.Peripheral is

   pragma Preelaborate;

   procedure Init;
   procedure Send (Data : in Unsigned_8);
   procedure Send (Data : in Buffer_Type);
   procedure Receive (Data : out Unsigned_8);
   procedure Receive (Data : out Buffer_Type);
   procedure Transfer (Data : in out Unsigned_8);
   procedure Transfer (Data : in out Buffer_Type);

end MSPGD.SPI.Peripheral;
