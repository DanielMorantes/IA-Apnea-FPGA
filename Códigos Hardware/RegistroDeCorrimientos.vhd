LIBRARY ieee;                                               
USE ieee.std_logic_1164.all; 


ENTITY RegistroDeCorrimientos IS
PORT( clk 			: IN STD_LOGIC;
	   n_Res 			: IN STD_LOGIC;
	   nRegCorr 		: IN STD_LOGIC;
	   bit_entrada 	: IN STD_LOGIC;
	  
		Registro_8_IN  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		clk_out 			: OUT STD_LOGIC; 
		n_Res_out			: OUT STD_LOGIC);
END ENTITY REGistroDeCorrimientos;


ARCHITECTURE behavior of RegistroDeCorrimientos IS
SIGNAL estado: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
PROCESS (clk, n_Res, nRegCorr, bit_entrada)
BEGIN 
IF ( n_Res = '1') THEN
	estado <= "00000000";
ELSIF (rising_edge(clk)) THEN
	IF (nRegCorr = '0') THEN 
		estado(7) <= bit_entrada;
		estado(6) <= estado(7);
		estado(5) <= estado(6);
		estado(4) <= estado(5);
		estado(3) <= estado(4);
		estado(2) <= estado(3);
		estado(1) <= estado(2);
		estado(0) <= estado(1);
				
	END IF;
END IF;

END PROCESS;

Registro_8_IN <= estado;
clk_out <= clk;
n_Res_out <= n_Res;

END ARCHITECTURE ;