--ANASTASIOS BENOS 3130141
-- TSOPELAS EFTHIMIOS 3130141

-- SELECTOR

Library ieee;
USE ieee.std_logic_1164.all;

entity trapUnit is
 port (
	opcode : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	EOR : OUT STD_LOGIC
);
END trapUnit;

ARCHITECTURE Behavior OF trapUnit IS 
BEGIN 
 PROCESS (opcode)
 BEGIN
	IF opcode = "1110" THEN
		EOR <= '1';
	ELSE
		EOR <= '0';
	END IF;
 END PROCESS;
END ARCHITECTURE Behavior;