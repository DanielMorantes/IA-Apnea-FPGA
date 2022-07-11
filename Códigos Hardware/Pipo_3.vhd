LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY Pipo_3 IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				Reset					:		IN		STD_LOGIC;
				n8byt					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				Pipo_3_IN		:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				
				Pipo_2_IN		:		OUT	STD_LOGIC_VECTOR(18 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture Pipo_3Arch of Pipo_3 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (18 DOWNTO 0);
signal D : std_logic_vector (18 DOWNTO 0);
signal O :  std_logic;

signal E : std_logic;
SIGNAL estado: STD_LOGIC_VECTOR(18 DOWNTO 0);

BEGIN
PROCESS (clk, Reset, n8byt, Pipo_3_IN)
BEGIN 
IF ( Reset = '0') THEN
	estado <= "0000000000000000000";
ELSIF (rising_edge(clk)) THEN
	IF (n8byt = '1') THEN 
		estado <= Pipo_3_IN;
						
	END IF;
END IF;

END PROCESS;

Pipo_2_IN <= estado;

End Pipo_3Arch;
