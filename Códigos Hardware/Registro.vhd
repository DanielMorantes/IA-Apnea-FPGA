LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------

ENTITY Registro IS
	PORT( 	clk				:		IN		STD_LOGIC;
				n_Res				:		IN		STD_LOGIC;
				Ena				:		IN 	STD_LOGIC;	
				Registro_IN		:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				
				Registro_OUT	:		OUT	STD_LOGIC_VECTOR(18 DOWNTO 0)
	);												
END ENTITY;

-------------------------------------
architecture Registro_Arch of Registro is
SIGNAL estado: STD_LOGIC_VECTOR(18 DOWNTO 0);
BEGIN

PROCESS (clk, n_Res, Ena, Registro_IN)
BEGIN 
IF ( n_Res = '1') THEN
	estado <= "0000000000000000000";
ELSIF (rising_edge(clk)) THEN
	IF (Ena = '1') THEN
		estado <= Registro_IN;						
	END IF;
END IF;

END PROCESS;

Registro_OUT <= estado;


End Registro_Arch;
