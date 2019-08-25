--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- REG16B ~~> PC REGISTER

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
		
Entity reg16b IS
	PORT (Input : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
		  Enable, Clock : IN STD_LOGIC; 
		  Output : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0)); 
END reg16b; 

Architecture Behavior of reg16b is
begin	
	Process (Input, Enable, Clock )
		begin
			Output <= Input;
	end process;
End architecture Behavior;