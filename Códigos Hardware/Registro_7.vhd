LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY Registro_7 IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				n_Res					:		IN		STD_LOGIC;
				nRegPar					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				Registro_7_IN		:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				
				Registro_6_IN		:		OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture Registro_7Arch of Registro_7 is
SIGNAL estado: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

PROCESS (clk, n_Res, nRegPar, Registro_7_IN)
BEGIN 
IF ( n_Res = '1') THEN
	estado <= "00000000";
ELSIF (rising_edge(clk)) THEN
	IF (nRegPar = '1') THEN 
		estado <= Registro_7_IN;
						
	END IF;
END IF;

END PROCESS;

Registro_6_IN <= estado;

End Registro_7Arch;
