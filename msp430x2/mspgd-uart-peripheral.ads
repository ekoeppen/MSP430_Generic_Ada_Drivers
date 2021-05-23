with MSP430_SVD; use MSP430_SVD;
with MSPGD.Clock.Source;

generic

	Speed: UInt32;
	with package Clock is new MSPGD.Clock.Source (<>);

package MSPGD.UART.Peripheral is

	pragma Preelaborate;

	procedure Init;
	procedure Transmit (Data : Byte);
	function Receive return Byte;
   function Data_Available return Boolean;

end MSPGD.UART.Peripheral;
