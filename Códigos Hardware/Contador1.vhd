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

entity contador1 is
	port(
		clk    			    			: in std_logic;
		Ctr_Count1				     	: in std_logic;
		RESET_C1							: in std_logic;
		S1                       	: out std_logic_vector(12 downto 0);
		FLAG1						      : out std_logic;
		FLAG2								: out std_logic

		);
	end entity contador1;     

architecture contador1Arch of contador1 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (12 downto 0);
signal D : std_logic_vector (12 downto 0);
signal Max_Count:  std_logic;
signal Mid_Count:  std_logic;


signal E : std_logic_vector (12 downto 0);


begin 

D(0)		<= not Q(0)  and not Max_Count;
D(1)		<= not Q(1)  and not Max_Count;
D(2)		<= not Q(2)  and not Max_Count;
D(3)		<= not Q(3)  and not Max_Count;
D(4)		<= not Q(4)  and not Max_Count;
D(5)		<= not Q(5)  and not Max_Count;
D(6)		<= not Q(6)  and not Max_Count;
D(7)		<= not Q(7)  and not Max_Count;
D(8)		<= not Q(8)  and not Max_Count;
D(9)		<= not Q(9)  and not Max_Count;
D(10)		<= not Q(10) and not Max_Count;
D(11) 	<= not Q(11) and not Max_Count;
D(12)		<= not Q(12) and not Max_Count;

E(0)  	<= Ctr_Count1;
E(1)  	<= Q(0) and Ctr_Count1;
E(2)  	<= (Q(0) and Q(1)) and Ctr_Count1;
E(3) 		<= (Q(0)and Q(1) and Q(2)) and Ctr_Count1;
E(4) 		<= (Q(0) and Q(1) and Q(2) and Q(3)) and Ctr_Count1;
E(5) 		<= (Q(0) and Q(1) and Q(2) and Q(3)and Q(4)) and Ctr_Count1;
E(6)  	<= (Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)) and Ctr_Count1;
E(7)  	<= (Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)and Q(6)) and Ctr_Count1;
E(8)  	<= (Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)and Q(6)and Q(7)) and Ctr_Count1;
E(9)  	<= (Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)and Q(6)and Q(7)and Q(8)) and Ctr_Count1;
E(10)	   <= (Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)and Q(6)and Q(7)and Q(8)and Q(9)) and Ctr_Count1;
E(11) 	<= ((Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)and Q(6)and Q(7)and Q(8)and Q(9)and Q(10))) and Ctr_Count1;
E(12)		<= ((Q(0) and Q(1) and Q(2) and Q(3)and Q(4)and Q(5)and Q(6)and Q(7)and Q(8)and Q(9)and Q(10)and Q(11))) and Ctr_Count1;


S1(0) 	<= Q(0);
S1(1) 	<= Q(1);
S1(2) 	<= Q(2);
S1(3) 	<= Q(3);
S1(4) 	<= Q(4);
S1(5) 	<= Q(5);
S1(6) 	<= Q(6);
S1(7) 	<= Q(7);
S1(8) 	<= Q(8);
S1(9) 	<= Q(9);
S1(10)   <= Q(10);
S1(11)   <= Q(11);
S1(12)	<=	Q(12);

--Max_Count <= Q(0) and not Q(1) and Q(2)and not Q(3) and not Q(4) and not Q(5)and Q(6) and not Q(7) and Q(8)and Q(9) and not Q(10) and not Q(11)and not Q(12);
--Max_Count <= Q(12) and not Q(11) and not Q(10)and Q(9) and Q(8) and not Q(7)and not Q(6) and not Q(5) and not Q(4)and not Q(3) and not Q(2) and not Q(1)and not Q(0);--24
--Mid_count <= not Q(0) and Q(1) and not Q(2)and Q(3) and not Q(4) and not Q(5)and not Q(6) and Q(7) and not Q(8)and Q(9) and Q(10) and not Q(11)and not Q(12);
--Mid_count <= not Q(12) and not Q(11) and Q(10)and Q(9) and not Q(8) and not Q(7)and not Q(6) and not Q(5) and not Q(4)and not Q(3) and not Q(2) and not Q(1)and not Q(0);--12

Max_Count <= Q(12) and not Q(11) and Q(10) and not Q(9) and not Q(8) and not Q(7)and Q(6) and not Q(5) and Q(4)and Q(3) and not Q(2) and not Q(1)and not Q(0);--104 us
Mid_count <= not Q(12) and Q(11) and not Q(10) and Q(9) and not Q(8) and not Q(7)and not Q(6) and Q(5) and not Q(4)and Q(3) and Q(2) and not Q(1)and not Q(0);--52us

FF1: 	dffe port map (D(0),  clk, RESET_C1, '1',  E(0)  ,Q(0));
FF2: 	dffe port map (D(1),  clk, RESET_C1, '1',  E(1)  ,Q(1));
FF3: 	dffe port map (D(2),  clk, RESET_C1, '1',  E(2)  ,Q(2));
FF4: 	dffe port map (D(3),  clk, RESET_C1, '1',  E(3)  ,Q(3));
FF5: 	dffe port map (D(4),  clk, RESET_C1, '1',  E(4)  ,Q(4));
FF6: 	dffe port map (D(5),  clk, RESET_C1, '1',  E(5)  ,Q(5));
FF7: 	dffe port map (D(6),  clk, RESET_C1, '1',  E(6)  ,Q(6));
FF8: 	dffe port map (D(7),  clk, RESET_C1, '1',  E(7)  ,Q(7));
FF9: 	dffe port map (D(8),  clk, RESET_C1, '1',  E(8)  ,Q(8));
FF10: dffe port map (D(9),  clk, RESET_C1, '1',  E(9)  ,Q(9));
FF11: dffe port map (D(10), clk, RESET_C1, '1',  E(10) ,Q(10));
FF12: dffe port map (D(11), clk, RESET_C1, '1',  E(11) ,Q(11));
FF13: dffe port map (D(12), clk, RESET_C1, '1',  E(12) ,Q(12));


FLAG1 <= Max_Count;
FLAG2 <= Mid_Count;

End contador1Arch;
