with MSP430_SVD; use MSP430_SVD;

package MSPGD.SPI is

   pragma Preelaborate;

   type Clock_Source_Type is (UCLK, ACLK, SMCLK);
   type SPI_Module_Type is (USCI_A, USCI_B);
   type SPI_Mode is (Mode_0, Mode_1, Mode_2, Mode_3);

end MSPGD.SPI;
