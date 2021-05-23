with MSP430_SVD; use MSP430_SVD;
with MSP430_SVD.PORT_1_2; use MSP430_SVD.PORT_1_2;
with MSP430_SVD.ADC10; use MSP430_SVD.ADC10;
with System.Machine_Code; use System.Machine_Code;
with System;

package body MSPGD.GPIO.Pin is

   procedure BIS (N : System.Address; Bit: UInt3) is
   begin
      --  Asm ("bis #%1, &%0", Volatile => True,
      --     Inputs => (System.Address'Asm_Input ("I", N), UInt3'Asm_Input ("I", Bit)));
      null;
   end BIS;

   procedure BIS_B (N : System.Address; Bits: Byte) is
   begin
      --  Asm ("bis.b %1, %0", Volatile => True,
      --     Inputs => (System.Address'Asm_Input ("m", N), Byte'Asm_Input ("i", Bits)));
      null;
   end BIS_B;

   procedure Init is
   begin
      case Port is
         when 1 =>
            if Direction = Output then PORT_1_2_Periph.P1DIR.Arr (Pin) := 1; end if;
            if Pull_Resistor /= None then
               PORT_1_2_Periph.P1REN.Arr (Pin) := 1;
               if Pull_Resistor = Up then PORT_1_2_Periph.P1OUT.Arr (Pin) := 1; end if;
            end if;
            case Alt_Func is
               when IO => null;
               when Primary =>
                  PORT_1_2_Periph.P1SEL.Arr (Pin) := 1;
               when Secondary =>
                  PORT_1_2_Periph.P1SEL.Arr (Pin) := 1;
                  PORT_1_2_Periph.P1SEL2.Arr (Pin) := 1;
               when Device_Specific =>
                  PORT_1_2_Periph.P1SEL2.Arr (Pin) := 1;
               when Analog =>
                  BIS (ADC10_Periph.ADC10AE0'Address, 2 ** Pin);
               when Comparator => null;
            end case;
         when 2 =>
            if Direction = Output then PORT_1_2_Periph.P2DIR.Arr (Pin) := 1; end if;
            if Pull_Resistor /= None then
               PORT_1_2_Periph.P2REN.Arr (Pin) := 1;
               if Pull_Resistor = Up then PORT_1_2_Periph.P2OUT.Arr (Pin) := 1; end if;
            end if;
         when others => null;
      end case;
   end Init;

   procedure Set is
   begin
      case Port is
         when 1 => PORT_1_2_Periph.P1OUT.Arr (Pin) := 1;
         when 2 => PORT_1_2_Periph.P2OUT.Arr (Pin) := 1;
         when others => null;
      end case;
   end Set;

   procedure Clear is
   begin
      case Port is
         when 1 => PORT_1_2_Periph.P1OUT.Arr (Pin) := 0;
         when 2 => PORT_1_2_Periph.P2OUT.Arr (Pin) := 0;
         when others => null;
      end case;
   end Clear;

   function Is_Set return Boolean is
   begin
      case Port is
         when 1 => return (PORT_1_2_Periph.P1IN.Val and 2 ** Pin) /= 0;
         when 2 => return (PORT_1_2_Periph.P2IN.Val and 2 ** Pin) /= 0;
         when others => return false;
      end case;
   end Is_Set;

end MSPGD.GPIO.Pin;
