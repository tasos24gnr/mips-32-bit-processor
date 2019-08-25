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
				
		
-----
library ieee;
use ieee.std_logic_1164.all;
Entity reg is 
Port (Input,Clock,Enable: in std_logic;
	  Output: out std_logic);
End reg;

Architecture Logicfunc of reg is
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


-----------------------
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

Architecture LogicFunc of reg16 is
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
	
end LogicFunc;

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

library ieee;
use ieee.std_logic_1164.all;
entity decode3to8  is 
port (
		input : in std_logic_vector (2 downto 0);
		output : out std_logic_vector(7 downto 0)
	 );
end decode3to8;

architecture LogicFunc of decode3to8 is
begin
	with input select
		 output <= "00000001" when "000",
					"00000010" when "001",
					"00000100" when "010",
					"00001000" when "011",
					"00010000" when "100",
					"00100000" when "101",
					"01000000" when "110",
					"10000000" when "111",
					"00000000" when others;
end LogicFunc;

library ieee;
use ieee.std_logic_1164.all;
entity regFile is
generic (
		n: integer :=16;
		k: integer :=3;
		regnum: integer :=8
		);
	port(
		clock : in std_logic;
		write1: in std_logic_vector(n-1 downto 0);
		write1ad,read1ad,read2ad: in std_logic_vector(k-1 downto 0);
		read1,read2 : out std_logic_vector(n-1 downto 0);
		outall : out std_logic_vector(n*regnum-1 downto 0) 
		);
end regFile;
architecture LogicFunc of regFile is
	component reg0 is
		port(
			input: in std_logic_vector (n-1 downto 0);
			enable, clock : in std_logic;
			output : out std_logic_vector(n-1 downto 0)
			 );
	end component;
	component reg16 is 
		port(
			input : in std_logic_vector(n-1 downto 0);
			enable , clock : in std_logic;
			output : out std_logic_vector (n-1 downto 0) 
			);
	end component;
	component decode3to8 is
		port(
			input: in std_logic_vector(k-1 downto 0);
			output: out std_logic_vector(regnum-1 downto 0)
			);
	end component;
	component mux8 is 
		port(
			input0,input1,input2,input3,input4,input5,input6,input7: in std_logic_vector(n-1 downto 0);
			choice : in std_logic_vector (k-1 downto 0);
			output : out std_logic_vector(n-1 downto 0)
			);
	end component;
	
	signal enablesigs : std_logic_vector(regnum-1 downto 0);
	signal re0,re1,re2,re3,re4,re5,re6,re7 : std_logic_vector(n-1 downto 0);
	Begin 
		G0: decode3to8 port map(write1ad,enablesigs);
		G1: reg0 port map(write1,enablesigs(0),clock,re0);
		G2: reg16 port map(write1,enablesigs(1),clock,re1);
		G3: reg16 port map(write1,enablesigs(2),clock,re2);
		G4: reg16 port map(write1,enablesigs(3),clock,re3);
		G5: reg16 port map(write1,enablesigs(4),clock,re4);
		G6: reg16 port map(write1,enablesigs(5),clock,re5);
		G7: reg16 port map(write1,enablesigs(6),clock,re6);
		G8: reg16 port map(write1,enablesigs(7),clock,re7);
		
		G9: mux8 port map(re0,re1,re2,re3,re4,re5,re6,re7, read1ad,read1);
		G10: mux8 port map(re0,re1,re2,re3,re4,re5,re6,re7, read2ad,read2);
		outall <= re7 & re6 & re5 & re4 & re3 & re2 & re1 & re0 ;
end LogicFunc;