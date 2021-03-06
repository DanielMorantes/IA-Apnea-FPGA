LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY RegOutROM IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				Reset					:		IN		STD_LOGIC;
				n8byt					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				qROMPares			:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				qROMImpares			:		IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				
				ROMParesOUT			:		OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				ROMImparesOUT		:		OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture RegOutROMArch of RegOutROM is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (7 DOWNTO 0);
signal D : std_logic_vector (7 DOWNTO 0);
signal O :  std_logic;

signal E : std_logic;
SIGNAL estado0: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL estado1: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
PROCESS (clk, Reset, n8byt, qROMPares, qROMImpares)
BEGIN 
IF ( Reset = '1') THEN
	estado0 <= "00000000";
	estado1 <= "00000000";
ELSIF (rising_edge(clk)) THEN
	IF (n8byt = '1') THEN 
		estado0 <= qROMPares;
		estado1 <= qROMImpares;
						
	END IF;
END IF;

END PROCESS;

ROMParesOUT <= estado0;
ROMImparesOUT <= estado1;

End RegOutROMArch;
