--ANASTASIOS BENOS 3130141 
--EFTHIMIOS TSOPELAS 3130210
library ieee;
use ieee.std_logic_1164.all;

entity AND1 is
port(in1,in2: in std_logic;
	  out1: out std_logic);
end AND1 ;

Architecture LogicFunc of AND1 is
BEGIN
	out1 <= in1 AND in2 ;
END LogicFunc;
--------------------------
library ieee;
use ieee.std_logic_1164.all;

entity OR1 is
port(in1,in2,in3: in std_logic;
	  out1: out std_logic);
end  OR1;

Architecture LogicFunc of  OR1 is
BEGIN
	out1 <= in1 OR in2 OR in3 ;
END LogicFunc;
--------------------------
library ieee;
use ieee.std_logic_1164.all;

entity XOR1 is
port(in1,in2,in3: in std_logic;
	  out1: out std_logic);
end  XOR1; 

Architecture LogicFunc of  XOR1 is
BEGIN
	out1 <= in1 XOR in2 XOR in3;
END LogicFunc;
--------------------------
library ieee;
use ieee.std_logic_1164.all;

entity fulladders is
port (a,b,c: in std_logic;
	  sum, carry: out std_logic);
end fulladders;

architecture logic_structural of fulladders is

component AND1 
port (in1,in2 : in std_logic;
	  out1: out std_logic);
end component ;

component OR1
port(in1,in2,in3: in std_logic;
	 out1: out std_logic);
end component;

component XOR1
port(in1,in2,in3: in std_logic;
	  out1: out std_logic);
end component;

SIGNAL s1,s2,s3 : std_logic;   -- fulladder 1+1 bit 
begin
 v0: XOR1 port map (a, b, c, sum);
 v1: AND1 port map (a, b, s1);
 v2: AND1 port map (a, c, s2);
 v3: AND1 port map (b, c, s3);
 v4: OR1 port map (s1, s2, s3, carry);
end logic_structural;

------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

Entity SIXTEENBITADDER is --16 fores ton fulladder
port (A, B: in std_logic_vector (15 downto 0);
 Cin: in std_logic;
sum: out std_logic_vector (15 downto 0);
Cout, V: out std_logic);
end SIXTEENBITADDER;
ARCHITECTURE SIXTEENBITADDER_structure of SIXTEENBITADDER is
Signal C: std_logic_vector (16 downto 1);
component fulladders
port (a, b, c: in std_logic;
sum, carry: out std_logic);
end component;
BEGIN
 FA0: fulladders port map (A(0), B(0), Cin, sum(0), C(1));
 FA1: fulladders port map (A(1), B(1), C(1), sum(1), C(2));
 FA2: fulladders port map (A(2), B(2), C(2), sum(2), C(3));
 FA3: fulladders port map (A(3), B(3), C(3), sum(3), C(4));
 FA4: fulladders port map (A(4), B(4), C(4), sum(4), C(5));
 FA5: fulladders port map (A(5), B(5), C(5), sum(5), C(6));
 FA6: fulladders port map (A(6), B(6), C(6), sum(6), C(7));
 FA7: fulladders port map (A(7), B(7), C(7), sum(7), C(8));
 FA8: fulladders port map (A(8), B(8), C(8), sum(8), C(9));
 FA9: fulladders port map (A(9), B(9), C(9), sum(9), C(10));
 FA10: fulladders port map (A(10), B(10), C(10), sum(10), C(11));
 FA11: fulladders port map (A(11), B(11), C(11), sum(11), C(12));
 FA12: fulladders port map (A(12), B(12), C(12), sum(12), C(13));
 FA13: fulladders port map (A(13), B(13), C(13), sum(13), C(14));
 FA14: fulladders port map (A(14), B(14), C(14), sum(14), C(15));
 FA15: fulladders port map (A(15), B(15), C(15), sum(15), C(16));


 V <= C(15) XOR C(16);
 Cout <= C(16);
END SIXTEENBITADDER_structure;

--------------------------------------------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.all;

entity mux is --apli ulopoiisi poluplekti
	port(in1,in2,sig: in std_logic;
			output: out std_logic);
end mux;

Architecture LogicFunc of mux is
begin
	output<= (in1 and not sig) or (in2 and sig);
end LogicFunc;

LIBRARY ieee;
use ieee.std_logic_1164.all;

entity mux3 is --poluplektis me 3 eisodous
	port(in1,in2,in3,sig1,sig2: in std_logic;
		  output: out std_logic);
end mux3;

Architecture LogicFunc of mux3 is
	component mux
		port(in1,in2,sig: in std_logic;
			  output : out std_logic);
	end component;
signal f: std_logic;
begin 
G1: mux port map (in1,in2,sig1,f);
G2: mux port map (f,in3,sig2,output);
end LogicFunc; 

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity fa is -- fulladder apo tis diafaneies
port (in1,in2,carryin: in std_logic;
		sum,carryout: out std_logic);
end fa;

architecture LogicFunc of fa is 
begin
	sum<= in1 xor in2 xor carryin;
	carryout<= (in1 and in2 ) or (in1 and carryin) or (in2 and carryin);
end LogicFunc;

LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

Entity AluSlice is
	port(input1,input2,carryin,ainvert,binvert,op1,op2: in std_logic;
	      output,carryout: out std_logic);
end AluSlice;

Architecture LogicFunc of AluSlice is
	component fa is
	port(in1,in2,carryin: in std_logic;
		  sum,carryout: out std_logic);
	end component;
	component mux is
		port(in1,in2,sig: in std_logic;
			  output: out std_logic);
	end component;
	component mux3 is
		port(in1,in2,in3,sig1,sig2: in std_logic;
			  output: out std_logic);
	end component;
signal f1,f2,f3,f4,f5 : std_logic;
begin
G0: mux port map(input1, not input1,ainvert,f1);
G1: mux port map(input2,not input2,binvert,f2);
f3<= f1 and f2;
f4<= f1 or f2;
G2: fa port map (f1,f2,carryin,f5,carryout);
G3: mux3 port map (f3,f4,f5,op1,op2,output);
End LogicFunc;


LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

Entity ALU is ----ALU
	Generic (
		n: INTEGER :=16
	);
	port( input1,input2 : in std_logic_vector(n-1 downto 0);
		  carryin: in std_logic;
		  carryout: out std_logic;
		  operation: in std_logic_vector(3 downto 0);
		  output: out std_logic_vector(n-1 downto 0)
		  );
end ALU;

Architecture Logicfunc of ALU is
 component AluSlice is
	Port( input1,input2,carryin,ainvert,binvert,op1,op2 : in std_logic;
		  output, carryout: out std_logic
		 );
 end component;

signal carryouts,tempoutput: std_logic_vector(n-1 downto 0);
signal cout : std_logic;

----Command Constants----
constant ADD_FUNC : std_logic_vector(3 downto 0) := "0000";
constant SUB_FUNC : std_logic_vector(3 downto 0) := "0001";
constant AND_FUNC : std_logic_vector(3 downto 0) := "0010";
constant OR_FUNC : std_logic_vector(3 downto 0) := "0011";
constant GEQ_FUNC : std_logic_vector(3 downto 0) := "0100";
constant NOT_FUNC : std_logic_vector(3 downto 0) := "0101";
------------------------
Begin
 G0: AluSlice port map (input1(0), input2(0), carryin, operation(3),operation(2),operation(1),operation(0),tempoutput(0),carryouts(0));
 G1: AluSlice port map (input1(1), input2(1), carryouts(0), operation(3),operation(2),operation(1),operation(0),tempoutput(1),carryouts(1));
 G2: AluSlice port map (input1(2), input2(2), carryouts(1), operation(3),operation(2),operation(1),operation(0),tempoutput(2),carryouts(2));
 G3: AluSlice port map (input1(3), input2(3), carryouts(2), operation(3),operation(2),operation(1),operation(0),tempoutput(3),carryouts(3));
 G4: AluSlice port map (input1(4), input2(4), carryouts(3), operation(3),operation(2),operation(1),operation(0),tempoutput(4),carryouts(4));
 G5: AluSlice port map (input1(5), input2(5), carryouts(4), operation(3),operation(2),operation(1),operation(0),tempoutput(5),carryouts(5));
 G6: AluSlice port map (input1(6), input2(6), carryouts(5), operation(3),operation(2),operation(1),operation(0),tempoutput(6),carryouts(6));
 G7: AluSlice port map (input1(7), input2(7), carryouts(6), operation(3),operation(2),operation(1),operation(0),tempoutput(7),carryouts(7));
 G8: AluSlice port map (input1(8), input2(8), carryouts(7), operation(3),operation(2),operation(1),operation(0),tempoutput(8),carryouts(8));
 G9: AluSlice port map (input1(9), input2(9), carryouts(8), operation(3),operation(2),operation(1),operation(0),tempoutput(9),carryouts(9));
 G10: AluSlice port map (input1(10), input2(10), carryouts(9), operation(3),operation(2),operation(1),operation(0),tempoutput(10),carryouts(10));
 G11: AluSlice port map (input1(11), input2(11), carryouts(10), operation(3),operation(2),operation(1),operation(0),tempoutput(11),carryouts(11));
 G12: AluSlice port map (input1(12), input2(12), carryouts(11), operation(3),operation(2),operation(1),operation(0),tempoutput(12),carryouts(12));
 G13: AluSlice port map (input1(13), input2(13), carryouts(12), operation(3),operation(2),operation(1),operation(0),tempoutput(13),carryouts(13));
 G14: AluSlice port map (input1(14), input2(14), carryouts(13), operation(3),operation(2),operation(1),operation(0),tempoutput(14),carryouts(14));
 G15: AluSlice port map (input1(15), input2(15), carryouts(14), operation(3),operation(2),operation(1),operation(0),tempoutput(15),cout);
 
 process(operation) 
	variable temp: std_logic_vector(n-1 downto 0);
	variable temp2: std_logic_vector(2*n-1 downto 0);
	variable temp3, temp4: std_logic;
  begin
	case operation is
		when ADD_FUNC =>
			temp := tempoutput;
		when SUB_FUNC =>
			temp := input1- input2;
		when AND_FUNC =>
			temp := tempoutput;
		when OR_FUNC =>
			temp := tempoutput;
		when GEQ_FUNC =>
			temp := (others => NOT(input1(n-1)));
			temp4 := '0';
			temp3 := NOT(input1(n-1));
		when NOT_FUNC => 
			temp := (others => '0');
			if (input1 = (n-1 downto 0 => '0'))then
				temp(0):='1';
			end if;
		when others =>
			temp := input1-input2;
	end case;
	if (temp4='0') then 
		carryout <= temp3;
	else 
		carryout <=cout;
	end if;
		output <= temp;
		
 end process;
end Logicfunc;