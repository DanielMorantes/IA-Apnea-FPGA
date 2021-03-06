LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------

ENTITY RegTemp IS
	PORT( 	clk				:		IN		STD_LOGIC;
				n_Res				:		IN		STD_LOGIC;
				nRegTemp				:		IN 	STD_LOGIC;	
				SumadorOUT		:		IN		STD_LOGIC_VECTOR (33 DOWNTO 0);
				
				RegTemp_OUT	:		OUT	STD_LOGIC_VECTOR(33 DOWNTO 0)
	);												
END ENTITY;

-------------------------------------
architecture RegTemp_Arch of RegTemp is
SIGNAL estado: STD_LOGIC_VECTOR(33 DOWNTO 0);
BEGIN

PROCESS (clk, n_Res, nRegTemp, SumadorOUT)
BEGIN 
IF ( n_Res = '1') THEN
	estado <= "0000000000000000000000000000000000";
ELSIF (rising_edge(clk)) THEN
	IF (nRegTemp = '1') THEN
		estado <= SumadorOUT;
						
	END IF;
END IF;

END PROCESS;

RegTemp_OUT <= estado;


End RegTemp_Arch;
