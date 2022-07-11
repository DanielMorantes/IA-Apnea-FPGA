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

entity RdROMCount is
	port(
		clk    			    					: in std_logic;
		ctrDir2				     				: in std_logic;
		RESET_dir								: in std_logic;
		rdaddressROM2capa                       	: out std_logic_vector(4 downto 0);
		F_DirROM2Capa						     		: out std_logic
				);
	end entity RdROMCount;     

architecture RdROMCountArch of RdROMCount is
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

E(0)  	<= ctrDir2;
E(1)  	<= Q(0) and ctrDir2;
E(2)  	<= (Q(0) and Q(1)) and ctrDir2;
E(3) 		<= (Q(0)and Q(1) and Q(2)) and ctrDir2;
E(3) 		<= (Q(0)and Q(1) and Q(3) and Q(4)) and ctrDir2;

rdaddressROM2capa(0) 	<= Q(0);
rdaddressROM2capa(1) 	<= Q(1);
rdaddressROM2capa(2) 	<= Q(2);
rdaddressROM2capa(3) 	<= Q(3);
rdaddressROM2capa(4) 	<= Q(4);

Max_Count <= Q(4) and Q(3) and Q(2) and not Q(1)and not Q(0); --28 cuentas

FF1: 	dffe port map (D(0),  clk, RESET_dir, '1',  E(0)  ,Q(0));
FF2: 	dffe port map (D(1),  clk, RESET_dir, '1',  E(1)  ,Q(1));
FF3: 	dffe port map (D(2),  clk, RESET_dir, '1',  E(2)  ,Q(2));
FF4: 	dffe port map (D(3),  clk, RESET_dir, '1',  E(3)  ,Q(3));
FF5: 	dffe port map (D(3),  clk, RESET_dir, '1',  E(3)  ,Q(3));

F_DirROM2Capa <= Max_Count;

End RdROMCountArch;
