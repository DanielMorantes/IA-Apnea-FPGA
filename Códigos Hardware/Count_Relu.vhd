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

entity Count_Relu is
	port(
		clk    			    			: in std_logic;
		Ctr_Count_Relu				   : in std_logic;
		RESET_CRelu						: in std_logic;
		
		S6                       	: out std_logic_vector(2 downto 0);
		FLAG_CRelu						: out std_logic;
		Reloj_out						: out std_logic;
		reset_out						: out std_logic

		);
	end entity Count_Relu;     

architecture Count_ReluArch of Count_Relu is
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

O <= Q(2) and Q(1) and Q(0); --7

E(0)  <= Ctr_Count_Relu;
E(1)  <= Q(0) and Ctr_Count_Relu;
E(2)  <= (Q(0) and Q(1)) and Ctr_Count_Relu;

S6(0) <= Q(0);
S6(1) <= Q(1);
S6(2) <= Q(2);

nRes <= not RESET_CRelu;

FF1: dffe port map (D(0), clk, nRes, '1',  E(0),Q(0));
FF2: dffe port map (D(1), clk, nRes, '1',  E(1),Q(1));
FF3: dffe port map (D(2), clk, nRes, '1',  E(2),Q(2));

FLAG_CRelu<=O;
Reloj_out <= clk;
Reset_out <= RESET_CRelu;

End Count_ReluArch;
