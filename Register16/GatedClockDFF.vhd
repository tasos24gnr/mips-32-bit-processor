--ANASTASIOS BENOS 3130141 
--EFTHIMIOS TSOPELAS 3130210
library ieee;
use ieee.std_logic_1164.all;
Entity GatedClockDFF is 
Port (Input,Clock,Enable: in std_logic;
	  Output: out std_logic);
End GatedClockDFF;

Architecture Logicfunc of GatedClockDFF is
signal P1,P2,P3,P4,five,six,afterClock: std_logic;
begin
	P3 <= P1 NAND P4;
	P1 <= afterClock NAND P3;
	P2 <= NOT(afterClock AND P1 AND P4);
	P4 <= Input NAND P2;
	five <= six NAND P1;
	six <= P2 NAND five;
	afterClock <= Clock AND Enable;
	Output <= five;
end Logicfunc;

Library ieee;
Use ieee.std_logic_1164.all;
Entity reg16 is
Generic (
				n: INTEGER := 16
		);
Port (input: in std_logic_vector(n-1 downto 0);
	  enable, clock : in std_logic;
	  output: out std_logic_vector(n-1 downto 0)
		);
end reg16;

Architecture Logicfunc of reg16 is
	component reg is
		port (input,clock,enable : in std_logic;
			  output: out std_logic);
	end component;
begin
	G0: reg port map (input(0), clock, enable , output(0));
	G1: reg port map (input(1), clock, enable , output(1));
	G2: reg port map (input(2), clock, enable , output(2));
	G3: reg port map (input(3), clock, enable , output(3));
	G4: reg port map (input(4), clock, enable , output(4));
	G5: reg port map (input(5), clock, enable , output(5));
	G6: reg port map (input(6), clock, enable , output(6));
	G7: reg port map (input(7), clock, enable , output(7));
	G8: reg port map (input(8), clock, enable , output(8));
	G9: reg port map (input(9), clock, enable , output(9));
	G10: reg port map (input(10), clock, enable , output(10));
	G11: reg port map (input(11), clock, enable , output(11));
	G12: reg port map (input(12), clock, enable , output(12));
	G13: reg port map (input(13), clock, enable , output(13));
	G14: reg port map (input(14), clock, enable , output(14));
	G15: reg port map (input(15), clock, enable , output(15));
	


	
end Logicfunc;