--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************************************************--
--             						                       --
--       												           --
--                                                      --
--******************************************************--

entity contador4 is
	port(
		clk    			    			: in std_logic;
		CtrCount4				     	: in std_logic;
		RESET								: in std_logic;
		S4                       	: out std_logic_vector(4 downto 0);
		F_Count4						      : out std_logic
				);
	end entity contador4;     

architecture contador4Arch of contador4 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (4 downto 0);
signal D : std_logic_vector (4 downto 0);
signal Max_Count:  std_logic;
signal Mid_Count:  std_logic;


signal E : std_logic_vector (4 downto 0);


begin 

D(0)		<= not Q(0)  and not Max_Count;
D(1)		<= not Q(1)  and not Max_Count;
D(2)		<= not Q(2)  and not Max_Count;
D(3)		<= not Q(3)  and not Max_Count;
D(4)		<= not Q(4)  and not Max_Count;

E(0)  	<= CtrCount4;
E(1)  	<= Q(0) and CtrCount4;
E(2)  	<= (Q(0) and Q(1)) and CtrCount4;
E(3) 		<= (Q(0)and Q(1) and Q(2)) and CtrCount4;
E(4) 		<= (Q(0) and Q(1) and Q(2) and Q(3)) and CtrCount4;

S4(0) 	<= Q(0);
S4(1) 	<= Q(1);
S4(2) 	<= Q(2);
S4(3) 	<= Q(3);
S4(4) 	<= Q(4);

Max_Count <= Q(4)and Q(3) and not Q(2) and not Q(1)and not Q(0); --24 cuentas

FF1: 	dffe port map (D(0),  clk, RESET, '1',  E(0)  ,Q(0));
FF2: 	dffe port map (D(1),  clk, RESET, '1',  E(1)  ,Q(1));
FF3: 	dffe port map (D(2),  clk, RESET, '1',  E(2)  ,Q(2));
FF4: 	dffe port map (D(3),  clk, RESET, '1',  E(3)  ,Q(3));
FF5: 	dffe port map (D(4),  clk, RESET, '1',  E(4)  ,Q(4));

F_Count4 <= Max_Count;

End contador4Arch;
