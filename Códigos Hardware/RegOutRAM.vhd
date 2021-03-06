LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY RegOutRAM IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				ResetRegRAM					:		IN		STD_LOGIC;
				n8byt					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				qRAMPares			:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				qRAMImpares			:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				
				ParesOUT				:		OUT	STD_LOGIC_VECTOR (18 DOWNTO 0);
				ImparesOUT			:		OUT	STD_LOGIC_VECTOR (18 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture RegOutRAMArch of RegOutRAM is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (18 DOWNTO 0);
signal D : std_logic_vector (18 DOWNTO 0);
signal O :  std_logic;

signal E : std_logic;
SIGNAL estado0: STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL estado1: STD_LOGIC_VECTOR(18 DOWNTO 0);

BEGIN
PROCESS (clk, ResetRegRAM, n8byt, qRAMPares, qRAMImpares)
BEGIN 
IF ( ResetRegRAM = '1') THEN
	estado0 <= "0000000000000000000";
	estado1 <= "0000000000000000000";
ELSIF (rising_edge(clk)) THEN
	IF (n8byt = '1') THEN 
		estado0 <= qRAMPares;
		estado1 <= qRAMImpares;
						
	END IF;
END IF;

END PROCESS;

ParesOUT <= estado0;
ImparesOUT <= estado1;

End RegOutRAMArch;
