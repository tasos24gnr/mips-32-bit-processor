--ANASTASIOS BENOS 3130141 
--EFTHIMIOS TSOPELAS 3130210
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity jumpAD is
	generic(
			n : integer :=16;
			k : integer :=12
			);
	
	port(
		jumpadr : in std_logic_vector(k-1 downto 0);
		instrp2ad : in std_logic_vector(n-1 downto 0);
		ejumpad : out std_logic_vector(n-1 downto 0)
		);
end jumpAD;

Architecture LogicFunc of jumpAD is
	signal extended,multed : std_logic_vector(n-1 downto 0);

begin
	extended <= (n-1 downto k => jumpadr(k-1))& (jumpadr);
process(instrp2ad)
	begin
		multed <= extended(n-2 downto 0) & '0';
		ejumpad <= std_logic_vector(unsigned (multed)+ unsigned(instrp2ad));
	end process;
end LogicFunc;
		
