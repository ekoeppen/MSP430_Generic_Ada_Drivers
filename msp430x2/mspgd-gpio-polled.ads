with MSPGD.GPIO.Pin;

generic

   with package Pin is new MSPGD.GPIO.Pin (<>);

package MSPGD.GPIO.Polled is

	pragma Preelaborate;

   procedure Configure_Trigger (Event : Boolean := False; Rising : Boolean := False; Falling : Boolean := False);
   procedure Wait_For_Trigger;
   procedure Clear_Trigger;
   function Triggered return Boolean;
   procedure Cancel_Wait;

end MSPGD.GPIO.Polled;
