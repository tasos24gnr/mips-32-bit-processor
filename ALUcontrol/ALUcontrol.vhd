--ANASTASIOS BENOS 3130141 
--EFTHIMIOS TSOPELAS 3130210
library ieee;
use ieee.std_logic_1164.all;

entity ALUcontrol is
port (opCode : in std_logic_vector (3 downto 0);
	  func: in std_logic_vector (2 downto 0);
	  output: out std_logic_vector (3 downto 0)
);
end ALUcontrol;

architecture behavioral of ALUcontrol is
begin
process (opCode,func) begin
	case opCode is
		when "0000" =>
				output(3) <= '0';
				output(2 downto 0)<= func(2 downto 0);
		when others => output <=opCode;
	end case;
end process;
END behavioral;
