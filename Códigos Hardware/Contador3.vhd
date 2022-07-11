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

entity contador3 is
	port(
		clk    			    			: in std_logic;
		nRegPar				  	   	: in std_logic;
		RESET								: in std_logic;
		
		S3                       	: out std_logic_vector(2 downto 0);
		F_Count3							: out std_logic;
		Reloj_out 						: out std_logic;
		reset_out						: out std_logic

		);
	end entity contador3;    

architecture contador3Arch of contador3 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (2 downto 0);
signal D : std_logic_vector (2 downto 0);
signal O :  std_logic;

signal E : std_logic_vector(2 DOWNTO 0);


begin 

D(0)<= not Q(0);
D(1)<= not Q(1);
D(2)<= not Q(2);

O<=Q(0) and Q(1) and Q(2);

E(0)  	<= nRegPar;
E(1)  	<= Q(0) and nRegPar;
E(2)  	<= (Q(0) and Q(1)) and nRegPar;


S3(0) <= Q(0);
S3(1) <= Q(1);
S3(2) <= Q(2);


FF1: dffe port map (D(0), clk, RESET, '1',  E(0) ,Q(0));
FF2: dffe port map (D(1), clk, RESET, '1',  E(1),Q(1));
FF3: dffe port map (D(2), clk, RESET, '1',  E(2),Q(2));


F_Count3 <= O;
Reloj_out <= clk;
Reset_out <= RESET;

End contador3Arch;
