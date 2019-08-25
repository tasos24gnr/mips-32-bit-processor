--ANASTASIOS BENOS 3130141 
--EFTHIMIOS TSOPELAS 3130210
library ieee;
use ieee.std_logic_1164.all;

entity mux8 is
generic(
		n: integer :=16
		);
port(input0,input1,input2,input3,input4,input5,input6,input7 :in std_logic_vector(n-1 downto 0);
	 choice : in std_logic_vector(2 downto 0);
	 output : out std_logic_vector(n-1 downto 0)
	 );
end mux8;

Architecture LogicFunc of mux8 is
begin
	with choice select
	output<=input0 when "000",
			input1 when "001",
			input2 when "010",
			input3 when "011",
			input4 when "100",
			input5 when "101",
			input6 when "110",
			input7 when "111",
			"0000000000000000" when others;
end LogicFunc;
				
		