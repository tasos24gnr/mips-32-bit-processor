--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- JR SELCTOR

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
	
Entity JRSelector is
	generic (
			n : integer := 16
	);
	PORT (
	   jumpAD, branchAd,PCP2AD :		IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	   JRopcode: 						IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	   result: 							OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END  JRSelector;

Architecture Behavior of JRSelector is 
begin
	process(jumpAD, branchAd,PCP2AD,JRopcode)
		begin
		if JRopcode = "00" then
			result <= PCP2AD;
		elsif JRopcode = "01"	then 
			result <= jumpAD;
		elsif JRopcode = "10"	then 
			result <= branchAd;
		else
			result <= PCP2AD;
		end if;

	
	end process;
	
end architecture Behavior;