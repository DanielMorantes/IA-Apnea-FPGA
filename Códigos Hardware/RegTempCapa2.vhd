LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY RegTempCapa2 IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				ResetRegTempCapa2					:		IN		STD_LOGIC;
				n_RegTemp2Capa					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				SumNeurona1			:		IN		STD_LOGIC_VECTOR (43 DOWNTO 0);
				SumNeurona2			:		IN		STD_LOGIC_VECTOR (43 DOWNTO 0);
				
				Neurona1				:		OUT	STD_LOGIC_VECTOR (43 DOWNTO 0);
				Neurona2			:		OUT	STD_LOGIC_VECTOR (43 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture RegTempCapa2Arch of RegTempCapa2 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (43 DOWNTO 0);
signal D : std_logic_vector (43 DOWNTO 0);
signal O :  std_logic;

signal E : std_logic;
SIGNAL estado0: STD_LOGIC_VECTOR(43 DOWNTO 0);
SIGNAL estado1: STD_LOGIC_VECTOR(43 DOWNTO 0);

BEGIN
PROCESS (clk, ResetRegTempCapa2, n_RegTemp2Capa, SumNeurona1, SumNeurona2)
BEGIN 
IF ( ResetRegTempCapa2 = '1') THEN
	estado0 <= "00000000000000000000000000000000000000000000";
	estado1 <= "00000000000000000000000000000000000000000000";
ELSIF (rising_edge(clk)) THEN
	IF (n_RegTemp2Capa = '1') THEN 
		estado0 <= SumNeurona1;
		estado1 <= SumNeurona2;
						
	END IF;
END IF;

END PROCESS;

Neurona1 <= estado0;
Neurona2 <= estado1;

End RegTempCapa2Arch;
