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

entity Count is
	port(
		clk    			    			: in std_logic;
		Ctr_Count_Relu				   : in std_logic;
		RESET_CRelu						: in std_logic;
		
		FLAG_CRelu						: out std_logic;
		Reloj_out						: out std_logic;
		reset_out						: out std_logic

		);
	end entity Count;     

architecture CountArch of Count is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;

signal S6 : std_logic_vector(2 downto 0);

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

E(0)  	<= Ctr_Count_Relu;
E(1)  	<= Q(0) and Ctr_Count_Relu;
E(2)  	<= (Q(0) and Q(1)) and Ctr_Count_Relu;

S6(0) <= Q(0);
S6(1) <= Q(1);
S6(2) <= Q(2);

nRes <= RESET_CRelu;

FF1: dffe port map (D(0), clk, RESET_CRelu, '1',  E(0),Q(0));
FF2: dffe port map (D(1), clk, RESET_CRelu, '1',  E(1),Q(1));
FF3: dffe port map (D(2), clk, RESET_CRelu, '1',  E(2),Q(2));

FLAG_CRelu<=O;
Reloj_out <= clk;
Reset_out <= RESET_CRelu;

--PROCESS()
--	     VARIABLE temp   :   UNSIGNED(N-1  DOWNTO  0);
--	 BEGIN
--	    IF(rst='1')  THEN
--		    temp   :=  (OTHERS   =>  '0');
--		 ELSIF(rising_edge(clk))  THEN
--		    IF (ena='1') THEN
--			    temp  :=  count_next;
--			 END IF;
--		END IF;
--		counter  <=  STD_LOGIC_VECTOR(temp);
--		count_s  <=  temp;
--	END PROCESS;

End CountArch;
