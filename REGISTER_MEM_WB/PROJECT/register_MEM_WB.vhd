--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- REGISTER_MEM_WB


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY register_MEM_WB is
	generic ( n : INTEGER := 16; addressSize : INTEGER := 3 );
	port(	Result : IN std_logic_vector(n-1 downto 0);
			RegAD : IN std_logic_vector(addressSize-1 downto 0);
			clk : IN std_logic;
			---------------------------------------------------------------------
			writeData : OUT std_logic_vector(n-1 downto 0);
			writeAD : OUT std_logic_vector(addressSize-1 downto 0)
	 );
end register_MEM_WB;

architecture Behavior of register_MEM_WB is 
begin
	process(Result, RegAD, clk)
		begin
			writeData <= Result;
			writeAD <= RegAD;
	end process;
end architecture Behavior;

