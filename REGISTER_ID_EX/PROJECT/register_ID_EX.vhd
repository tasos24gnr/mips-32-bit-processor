--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- REGISTER_ID_EX



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
	
	
Entity register_ID_EX is
	generic ( n : INTEGER := 16; addressSize : INTEGER := 3 );
	port (
			clock, isEOR, wasJumpOut, isJump, isJR, isBranch, isR, isMFPC, isLW, isSW, isReadDigit, isPrintDigit : in std_logic;
		ALUFunc : in STD_LOGIC_VECTOR(3 DOWNTO 0);
		R1Reg , R2Reg , immediate16 : IN std_logic_vector(n-1 downto 0);
		R2AD, R1AD : IN std_logic_vector(addressSize-1 downto 0);
		jumpShortAddr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		---------------------------------------------------------------------
		isEOR_IDEX, wasJumpOut_IDEX, isJump_IDEX, isJR_IDEX , isBranch_IDEX, isR_IDEX, isMFPC_IDEX, isLW_IDEX, isSW_IDEX, isReadDigit_IDEX, isPrintDigit_IDEX : out STD_LOGIC;
		ALUFunc_IDEX : out STD_LOGIC_VECTOR(3 DOWNTO 0);
		R1Reg_IDEX , R2Reg_IDEX , immediate16_IDEX : OUT STD_LOGIC_VECTOR(n-1 downto 0);
		R2AD_IDEX , R1AD_IDEX : OUT STD_LOGIC_VECTOR(addressSize-1 downto 0);
		jumpShortAddr_IDEX : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	 );
end register_ID_EX;

Architecture Behavior of register_ID_EX is
begin
	process (clock, isEOR, wasJumpOut, isJump, isJR, isBranch, isR, isMFPC, isLW, isSW, isReadDigit, isPrintDigit, ALUFunc,R1Reg , R2Reg , immediate16,R2AD, R1AD,jumpShortAddr) 
		begin
			if isLW = '1' OR isSW= '1' OR isPrintDigit= '1' OR isReadDigit= '1' then   --=>>> EXMEM
				isLW_IDEX<=isLW;
				isSW_IDEX<=isSW;
				isPrintDigit_IDEX<=isPrintDigit;
				isReadDigit_IDEX<=isReadDigit;
				R2Reg_IDEX<=R2Reg;
				R1AD_IDEX<=R1AD;
								--APO SXHMA
			end if;
			if isR= '1' or isMFPC= '1' or isEOR='1'  then     -- =>>>>>alu
				isR_IDEX<=isR;
				ALUFunc_IDEX<= ALUFunc;
				immediate16_IDEX<= immediate16;
				isMFPC_IDEX <= isMFPC;
				isEOR_IDEX <= isEOR;
				R1Reg_IDEX<= R1Reg;
			end if;
			-- 
			if isJump='1' OR wasJumpOut='1' OR  isJR = '1' OR isBranch = '1' THEN
				wasJumpOut_IDEX <= wasJumpOut;
				isJump_IDEX <= isJump;
				isJR_IDEX <= isJR;
				isBranch_IDEX <= isBranch;
				jumpShortAddr_IDEX <= jumpShortAddr;
			end if;	
		end process;

end Architecture Behavior;