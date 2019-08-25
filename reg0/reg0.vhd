--ANASTASIOS BENOS 3130141 
--EFTHIMIOS TSOPELAS 3130210
Library ieee;
USE ieee.std_logic_1164.all;

Entity reg0 is
generic(
		n: Integer :=16
		);
		port (input : in std_logic_vector(n-1 downto 0);
			  enable, clock : in std_logic;
			  output: out std_logic_vector(n-1 downto 0)
			 );
end reg0;

Architecture behavior of reg0 is
begin 
	output<= (others => '0');
end behavior;