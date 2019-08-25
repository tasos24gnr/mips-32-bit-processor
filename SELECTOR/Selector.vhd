--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130210

-- SELECTOR

library ieee;
use ieee.std_logic_1164.all;

entity Selector is
GENERIC (
		 n : INTEGER := 16
		);

port (Reg , Memory , WriteBack : IN STD_LOGIC_VECTOR (n-1 downto 0);
	operation : IN STD_LOGIC_VECTOR(1 downto 0 );
	output : OUT STD_LOGIC_VECTOR(n-1 downto 0));
end Selector;

architecture behavior of Selector IS 
begin
	with operation select
			output <= Reg when "00",
			WriteBack when "01",
			Memory when "10",
			"0000000000000000" when "11";
end architecture behavior;