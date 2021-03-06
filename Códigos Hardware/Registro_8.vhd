LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY Registro_8 IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				n_Res					:		IN		STD_LOGIC;
				nRegPar					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				Registro_8_IN		:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				
				Registro_7_IN		:		OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture Registro_8Arch of Registro_8 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (7 downto 0);
signal D : std_logic_vector (7 downto 0);
signal O :  std_logic;

signal E : std_logic;
SIGNAL estado: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
PROCESS (clk, n_Res, nRegPar, Registro_8_IN)
BEGIN 
IF ( n_Res = '1') THEN
	estado <= "00000000";
ELSIF (rising_edge(clk)) THEN
	IF (nRegPar = '1') THEN 
		estado <= Registro_8_IN;
						
	END IF;
END IF;

END PROCESS;

Registro_7_IN <= estado;

End Registro_8Arch;
