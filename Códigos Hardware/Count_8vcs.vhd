--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************--
--             						                       --
--       												           --
--                                                      --
--******************--

entity Count_8vcs is
	port(
		clk    			    			: in std_logic;
		n8byt				 				  : in std_logic;
		RESET								: in std_logic;
		
		SMP                       	: out std_logic_vector(3 downto 0);
		count8vcs							: out std_logic
	);
	end entity Count_8vcs;
	
architecture Count_8vcsArch of Count_8vcs is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (4 downto 0);
signal D : std_logic_vector (4 downto 0);
signal Max_Count:  std_logic;

signal E : std_logic_vector (4 downto 0);
signal RESET8vcs  : std_logic;


begin 

D(0)		<= not Q(0)  and not Max_Count;
D(1)		<= not Q(1)  and not Max_Count;
D(2)		<= not Q(2)  and not Max_Count;
D(3)		<= not Q(3)  and not Max_Count;

E(0)  	<= n8byt;
E(1)  	<= Q(0) and n8byt;
E(2)  	<= (Q(0) and Q(1)) and n8byt;
E(3) 		<= (Q(0)and Q(1) and Q(2)) and n8byt;

SMP(0) 	<= Q(0);
SMP(1) 	<= Q(1);
SMP(2) 	<= Q(2);
SMP(3) 	<= Q(3);

Max_Count <= not Q(3) and Q(2) and Q(1)and Q(0); --8

RESET8vcs <= not RESET;

FF1: 	dffe port map (D(0),  clk, RESET, '1',  E(0)  ,Q(0));
FF2: 	dffe port map (D(1),  clk, RESET, '1',  E(1)  ,Q(1));
FF3: 	dffe port map (D(2),  clk, RESET, '1',  E(2)  ,Q(2));
FF4: 	dffe port map (D(3),  clk, RESET, '1',  E(3)  ,Q(3));

count8vcs <= Max_Count;

End Count_8vcsArch;