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

entity RdRAMCount is
	port(
		clk    			    					: in std_logic;
		ctrDir2				     				: in std_logic;
		RESET_dir								: in std_logic;
		rdaddress2capa                       	: out std_logic_vector(3 downto 0);
		F_Dir2						     		: out std_logic
				);
	end entity RdRAMCount;     

architecture RdRAMCountArch of RdRAMCount is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (3 downto 0);
signal D : std_logic_vector (3 downto 0);
signal Max_Count:  std_logic;
signal Mid_Count:  std_logic;
SIGNAL Reset_int: std_logic;


signal E : std_logic_vector (3 downto 0);


begin 

D(0)		<= not Q(0)  and not Max_Count;
D(1)		<= not Q(1)  and not Max_Count;
D(2)		<= not Q(2)  and not Max_Count;
D(3)		<= not Q(3)  and not Max_Count;

E(0)  	<= ctrDir2;
E(1)  	<= Q(0) and ctrDir2;
E(2)  	<= (Q(0) and Q(1)) and ctrDir2;
E(3) 		<= (Q(0)and Q(1) and Q(2)) and ctrDir2;

rdaddress2capa(0) 	<= Q(0);
rdaddress2capa(1) 	<= Q(1);
rdaddress2capa(2) 	<= Q(2);
rdaddress2capa(3) 	<= Q(3);

Max_Count <= Q(3) and Q(2) and Q(1)and not Q(0); --14 cuentas

Reset_int <= not RESET_dir;

FF1: 	dffe port map (D(0),  clk, Reset_int, '1',  E(0)  ,Q(0));
FF2: 	dffe port map (D(1),  clk, Reset_int, '1',  E(1)  ,Q(1));
FF3: 	dffe port map (D(2),  clk, Reset_int, '1',  E(2)  ,Q(2));
FF4: 	dffe port map (D(3),  clk, Reset_int, '1',  E(3)  ,Q(3));

F_Dir2 <= Max_Count;

End RdRAMCountArch;
