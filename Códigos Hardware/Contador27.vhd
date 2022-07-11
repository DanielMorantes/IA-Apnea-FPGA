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

entity Contador27 is
	port(
		clk    			    					: in std_logic;
		ctr8count				     				: in std_logic;
		RESET_dir								: in std_logic;
		cuentas27                       	: out std_logic_vector(4 downto 0);
		count8ctr						     	: out std_logic
				);
	end entity Contador27;     

architecture Contador27Arch of Contador27 is
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

E(0)  	<= ctr8count;
E(1)  	<= Q(0) and ctr8count;
E(2)  	<= (Q(0) and Q(1)) and ctr8count;
E(3) 		<= (Q(0)and Q(1) and Q(2)) and ctr8count;
E(4) 		<= (Q(0)and Q(1) and Q(2) and Q(3)) and ctr8count;

cuentas27(0) 	<= Q(0);
cuentas27(1) 	<= Q(1);
cuentas27(2) 	<= Q(2);
cuentas27(3) 	<= Q(3);
cuentas27(4) 	<= Q(4);

Max_Count <= Q(4) and Q(3) and not Q(2) and Q(1)and Q(0); --27 cuentas

FF1: 	dffe port map (D(0),  clk, RESET_dir, '1',  E(0)  ,Q(0));
FF2: 	dffe port map (D(1),  clk, RESET_dir, '1',  E(1)  ,Q(1));
FF3: 	dffe port map (D(2),  clk, RESET_dir, '1',  E(2)  ,Q(2));
FF4: 	dffe port map (D(3),  clk, RESET_dir, '1',  E(3)  ,Q(3));
FF5: 	dffe port map (D(4),  clk, RESET_dir, '1',  E(4)  ,Q(4));

count8ctr <= Max_Count;

End Contador27Arch;
