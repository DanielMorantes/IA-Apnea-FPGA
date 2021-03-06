LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------
ENTITY Softmax IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				RESET					:		IN		STD_LOGIC;
				n_softmax			:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				Neurona1				:		IN		STD_LOGIC_VECTOR (43 DOWNTO 0);
				Neurona2				:		IN		STD_LOGIC_VECTOR (43 DOWNTO 0);
				
				Apnea_OUT				:		OUT	STD_LOGIC
								);												
END ENTITY;

-------------------------------------
architecture SoftmaxArch of Softmax is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (43 DOWNTO 0);
signal D : std_logic_vector (43 DOWNTO 0);
signal O :  std_logic;

signal E : std_logic;
SIGNAL estado0: STD_LOGIC;

SIGNAL aux_n1 : integer;
SIGNAL aux_n2 : integer;

BEGIN

aux_n1 <= to_integer(signed(neurona1));
aux_n2 <= to_integer(signed(neurona2));

PROCESS (clk, RESET, n_softmax, Neurona1, Neurona2)
BEGIN 
IF ( RESET = '1') THEN
	estado0 <= '0';
ELSIF (rising_edge(clk)) THEN
	IF (n_softmax = '1') THEN 
		IF (aux_n1 > aux_n2) THEN
			estado0 <= '1';
		ELSIF (aux_n2 > aux_n1) THEN 
			estado0 <= '0';
		ELSE
			estado0 <= '0';
		END IF;
	END IF;
END IF;

END PROCESS;

Apnea_OUT <= estado0;

End SoftmaxArch;
