--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130210

-- REGISTER_IF_ID

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity fa is -- fulladder apo tis diafaneies
port (in1,in2,carryin: in std_logic;
sum,carryout: out std_logic
);
end fa;

architecture LogicFunc of fa is 
begin
sum<= in1 xor in2 xor carryin;
carryout<= (in1 and in2 ) or (in1 and carryin) or (in2 and carryin);
end LogicFunc;


library ieee;
use ieee.std_logic_1164.all;


entity register_IF_ID is
generic ( n : INTEGER := 16 );
port (
  inPC, inInstruction : IN std_logic_vector(n-1 downto 0);
  clock, IF_Flush, IF_ID_ENABLE : IN std_logic;
  ---------------------------------------------------------------------
  outPC, outInstruction : OUT std_logic_vector(n-1 downto 0)
);
end  register_IF_ID;

Architecture Behavior of register_IF_ID is

component fa
port(in1,in2,carryin: in std_logic;
 sum,carryout: out std_logic
);
end component;	

signal carryouts,outpctemp : std_logic_vector(15 downto 0);

BEGIN
G0: fa port map (inPC(0),'0','0',outpctemp(0),carryouts(0));
G1: fa port map (inPC(1),'1',carryouts(0),outpctemp(1),carryouts(1));
G2: fa port map (inPC(2),'0',carryouts(1),outpctemp(2),carryouts(2));
G3: fa port map (inPC(3),'0',carryouts(2),outpctemp(3),carryouts(3));
G4: fa port map (inPC(4),'0',carryouts(3),outpctemp(4),carryouts(4));
G5: fa port map (inPC(5),'0',carryouts(4),outpctemp(5),carryouts(5));
G6: fa port map (inPC(6),'0',carryouts(5),outpctemp(6),carryouts(6));
G7: fa port map (inPC(7),'0',carryouts(6),outpctemp(7),carryouts(7));
G8: fa port map (inPC(8),'0',carryouts(7),outpctemp(8),carryouts(8));
G9: fa port map (inPC(9),'0',carryouts(8),outpctemp(9),carryouts(9));
G10: fa port map (inPC(10),'0',carryouts(9),outpctemp(10),carryouts(10));
G11: fa port map (inPC(11),'0',carryouts(10),outpctemp(11),carryouts(11));
G12: fa port map (inPC(12),'0',carryouts(11),outpctemp(12),carryouts(12));
G13: fa port map (inPC(13),'0',carryouts(12),outpctemp(13),carryouts(13));
G14: fa port map (inPC(14),'0',carryouts(13),outpctemp(14),carryouts(14));
G15: fa port map (inPC(15),'0',carryouts(14),outpctemp(15),carryouts(15));
process( inPC, inInstruction , clock, IF_Flush, IF_ID_ENABLE)
begin
if IF_FLUSH = '1' then
outPC <= "0000000000000000";
outInstruction <= "0000000000000000";
else
outInstruction <= inInstruction;
outPC<=outpctemp;
end if;
end process;	
END Architecture Behavior;