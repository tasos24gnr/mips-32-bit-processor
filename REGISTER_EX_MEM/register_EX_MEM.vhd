--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- REGISTER_EX_MEM

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
	
Entity register_EX_MEM is
	generic ( n : INTEGER := 16; addressSize : INTEGER := 3 );
	port (
		clock, isLW, WriteEnable, ReadDigit, PrintDigit : IN std_logic;
  	 	R2Reg, Result : IN std_logic_vector(n-1 downto 0);
  	 	RegAD : IN std_logic_vector(addressSize-1 downto 0);
  	 	---------------------------------------------------------------------
		isLW_EXMEM, WriteEnable_EXMEM, ReadDigit_EXMEM, PrintDigit_EXMEM : OUT std_logic;
  	 	R2Reg_EXMEM, Result_EXMEM : OUT std_logic_vector(n-1 downto 0);
  	 	RegAD_EXMEM : OUT std_logic_vector(addressSize-1 downto 0)
	 );
end  register_EX_MEM;

Architecture Behavior of register_EX_MEM IS
BEGIN
	Process(clock, isLW, WriteEnable, ReadDigit, PrintDigit,R2Reg, Result,RegAD )
	BEGIN
		isLW_EXMEM <= isLW; 
		WriteEnable_EXMEM <= WriteEnable;
		ReadDigit_EXMEM <= ReadDigit;
		PrintDigit_EXMEM <= PrintDigit;
		R2Reg_EXMEM <= R2Reg;
		Result_EXMEM <= Result;
		RegAD_EXMEM <= RegAD;
	end process;
END Architecture Behavior;