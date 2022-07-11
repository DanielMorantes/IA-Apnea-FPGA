--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************************************************--
-- Comentarios  						                       --
--       												           --
--                                                      --
--******************************************************--

entity contador2 is
	port(
		clk    			    			: in std_logic;
		Ctr_Count2				     	: in std_logic;
		RESET_C2							: in std_logic;
		
		S2                       	: out std_logic_vector(2 downto 0);
		FLAG3								: out std_logic;
		n_Res								: out std_logic;
		Reloj_out						: out std_logic;
		reset_out						: out std_logic

		);
	end entity contador2;     

architecture contador2Arch of contador2 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (2 downto 0);
signal D : std_logic_vector (2 downto 0);
signal O :  std_logic;

signal E : std_logic_vector(2 DOWNTO 0);
signal nRes : std_logic;


begin 

D(0) <= not Q(0) and not O;
D(1) <= not Q(1) and not O;
D(2) <= not Q(2) and not O;

O <= Q(0) and Q(1) and Q(2);

E(0)  	<= Ctr_Count2;
E(1)  	<= Q(0) and Ctr_Count2;
E(2)  	<= (Q(0) and Q(1)) and Ctr_Count2;

S2(0) <= Q(0);
S2(1) <= Q(1);
S2(2) <= Q(2);

nRes <= RESET_C2;

FF1: dffe port map (D(0), clk, RESET_C2, '1',  E(0),Q(0));
FF2: dffe port map (D(1), clk, RESET_C2, '1',  E(1),Q(1));
FF3: dffe port map (D(2), clk, RESET_C2, '1',  E(2),Q(2));

FLAG3<=O;
Reloj_out <= clk;
Reset_out <= RESET_C2;

End contador2Arch;
