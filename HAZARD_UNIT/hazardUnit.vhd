--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- HAZARD UNIT

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hazardUnit IS 
 PORT (
		isJR, isJump, wasJump, mustBranch : IN STD_LOGIC;
		flush, wasJumpOut: OUT STD_LOGIC;
		JRopcode: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END hazardUnit;

ARCHITECTURE Behavior OF hazardUnit IS 
BEGIN
 Process (isJR, isJump, wasJump, mustBranch)
	Begin
		flush <='0';
		if isJR ='1' OR isJump = '1' OR wasJump = '1' OR mustBranch = '1' THEN
			flush <= '1';
		end if;
		if isJump = '1' then
			JRopcode <="01";
		elsif mustBranch = '1' then 
		 	JRopcode <="10";
		else 
			JRopcode <="00";
		end if;
 end process;
wasJumpOut <= isJump;

end architecture Behavior;
