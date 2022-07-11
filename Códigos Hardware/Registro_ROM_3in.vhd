LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------

ENTITY Registro_ROM_3in IS
	PORT( 	clk				:		IN		STD_LOGIC;
				n_Res				:		IN		STD_LOGIC;
				Ena_1				:		IN 	STD_LOGIC;	
				Ena_2				:		IN 	STD_LOGIC;	
				Ena_3				:		IN 	STD_LOGIC;	
				Registro_IN_1	:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				Registro_IN_2	:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				Registro_IN_3	:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				
				Registro_OUT	:		OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
	);												
END ENTITY;

-------------------------------------
architecture Registro_Arch of Registro_ROM_3in is
SIGNAL estado: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

PROCESS (clk, n_Res, Ena_1, Ena_2, Ena_3, Registro_IN_1, Registro_IN_2, Registro_IN_3)
BEGIN 
IF ( n_Res = '1') THEN
	estado <= "00000000";
ELSIF (rising_edge(clk)) THEN
	IF ((Ena_1 = '1') AND (Ena_2 = '1') AND (Ena_3 = '1')) THEN
		estado <= Registro_IN_3;
	ELSIF ((Ena_1 = '0') AND (Ena_2 = '1') AND (Ena_3 = '1')) THEN
		estado <= Registro_IN_2;
	ELSIF ((Ena_1 = '0') AND (Ena_2 = '0') AND (Ena_3 = '1')) THEN
		estado <= Registro_IN_1;
	ELSE
		estado <= estado;
	END IF;
END IF;

END PROCESS;

Registro_OUT <= estado;


End Registro_Arch;