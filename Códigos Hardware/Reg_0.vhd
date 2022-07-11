LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY Reg_0 IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				Reset					:		IN		STD_LOGIC;
				n8byt					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				Reg_A_IN				:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				Reg_B_IN				:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				
				Reg_A_OUT			:		OUT	STD_LOGIC_VECTOR(18 DOWNTO 0);
				Reg_B_OUT			:		OUT	STD_LOGIC_VECTOR (18 DOWNTO 0)
								);												
END ENTITY;

-------------------------------------
architecture Reg_0Arch of Reg_0 is
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
PROCESS (clk, Reset, n8byt, Reg_A_IN, Reg_B_IN)
BEGIN 
IF ( Reset = '0') THEN
	estado0 <= "0000000000000000000";
	estado1 <= "0000000000000000000";
ELSIF (rising_edge(clk)) THEN
	IF (n8byt = '1') THEN 
		estado0 <= Reg_A_IN;
		estado1 <= Reg_B_IN;
						
	END IF;
END IF;

END PROCESS;

Reg_A_OUT <= estado0;
Reg_B_OUT <= estado1;

End Reg_0Arch;
