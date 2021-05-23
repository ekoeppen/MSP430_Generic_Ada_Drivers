package MSPGD.Clock is

   pragma Preelaborate;

   type Source_Type is (ACLK, MCLK, SMCLK);
   type Input_Type is (DCO, VLO, LFXT1, XT2);

end MSPGD.Clock;
