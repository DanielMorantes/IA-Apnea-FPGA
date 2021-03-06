LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY Memoria IS 
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			nRegPar				:		IN		STD_LOGIC;
			rdaddress	  		: 		IN		STD_LOGIC_VECTOR (4 DOWNTO 0);
			Registro_7_IN		: 		IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_6_IN		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_5_IN		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_4_IN		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_3_IN		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_2_IN		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_1_IN		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Registro_1_OUT		: 		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			ena_RAM_1			:		IN		STD_LOGIC; --Enables RAM's entrada
			ena_RAM_2			:		IN		STD_LOGIC;
			ena_RAM_3			:		IN		STD_LOGIC;
			ena_RAM_4			:		IN		STD_LOGIC;
			ena_RAM_5			:		IN		STD_LOGIC;
			ena_RAM_6			:		IN		STD_LOGIC;
			ena_RAM_7			:		IN		STD_LOGIC;
			ena_RAM_8			:		IN		STD_LOGIC;
			qAbdom				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qF_Aire				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qPPG					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qTorax				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qI_Ronq				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qSPO2					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qC4A1					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qO2A1					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			Control_NN			:		OUT	STD_LOGIC;
			Reset_out_ext		:		OUT  	STD_LOGIC;
			Reloj_out			:		OUT	STD_LOGIC;
			wren_out				:		OUT	STD_LOGIC
			);
	      

END ENTITY Memoria;

ARCHITECTURE	functional OF Memoria IS

	SIGNAL	clock    		: STD_LOGIC;
	SIGNAL   data	    		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	--SIGNAL   rdaddress  		: STD_LOGIC_VECTOR (4 DOWNTO 0);
	--SIGNAL 	rden		  		: STD_LOGIC;
	SIGNAL   wraddress 		: STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL   wren       		: STD_LOGIC;
	SIGNAL   q					: STD_LOGIC_VECTOR(7 downto 0);
--	SIGNAL	Registro_7_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_6_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_5_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_4_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_3_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_2_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_1_IN	: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL	Registro_1_OUT	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	S3						: STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL	S4						: STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL   CtrDir       		: STD_LOGIC;
-- SIGNAL   Direcciones  		: STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL   F_Dir       		: STD_LOGIC;
-- SIGNAL	wraddress			: STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL   RESET_dir				: STD_LOGIC;
	SIGNAL	F_Count3 			: STD_LOGIC;
	SIGNAL   F_Count4				: STD_LOGIC;
	SIGNAL   CtrCount4			: STD_LOGIC;
	--SIGNAL	reloj_out    		: STD_LOGIC;
	SIGNAL	Reset_out			: STD_LOGIC;
	--SIGNAL	S3						: STD_LOGIC_VECTOR(2 downto 0);
		
	
BEGIN
		
		RAM_Abdom: ENTITY work.RAM_Abdom
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_7_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_1,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qAbdom);
						
		RAM_F_Aire: ENTITY work.RAM_F_Aire
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_6_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_7,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qF_Aire);				
		
		RAM_PPG: ENTITY work.RAM_PPG
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_5_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_6,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qPPG);
					
		RAM_Torax: ENTITY work.RAM_Torax
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_4_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_8,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qTorax);		
		
		RAM_I_Ronq: ENTITY work.RAM_I_Ronq
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_3_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_2,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qI_Ronq);	
		
		RAM_SPO2: ENTITY work.RAM_SPO2
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_2_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_3,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qSPO2);	
						
		RAM_C4A1: ENTITY work.RAM_C4A1
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_1_IN,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_4,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qC4A1);	
		
		RAM_O2A1: ENTITY work.RAM_O2A1
		PORT MAP (	clock					=> clk,
						--RESET					=> RESET,
						data					=> Registro_1_OUT,
						rdaddress 			=> rdaddress,
						rden	   			=> ena_RAM_5,
						wraddress 			=> wraddress,
						wren					=> wren,
						q						=> qO2A1);
		
--		SUMA1: ENTITY work.SUMA1
--		PORT MAP (	clk    		=> clk,
--						Ctr_Count1	=> Ctr_Count1,
--						RESET_C1			=> RESET_C1,
--						S1          => S1,
--						FLAG1			=> FLAG1,
--						FLAG2			=> FLAG2);

						
		Direcciones: ENTITY work.Direcciones
		PORT MAP (	clk	    	=> clk,
						CtrDir		=> CtrDir,
						RESET_dir	=> ResET_dir,
						F_Dir      => F_Dir,
						wraddress   => wraddress);						

		contador3: ENTITY work.contador3
		PORT MAP (	clk    		=> clk,
						nRegPar		=> nRegPar,
						RESET			=> RESET,
						S3          => S3,
						F_Count3		=> F_Count3,
						Reloj_out	=> Reloj_out,
						reset_out	=> reset_out);	
		
		contador4: ENTITY work.contador4
		PORT MAP (	clk    		=> clk,
						CtrCount4	=> CtrCount4,
						RESET			=> RESET,
						S4          => S4,
						F_Count4		=> F_Count4);	
						
		control_memorias: ENTITY work.control_memorias
		PORT MAP (  clk			=> clk,
						RESET			=> RESET,
						F_Count3		=>	F_Count3,
						F_Count4		=>	F_Count4,
						CtrDir		=> CtrDir,
						RESET_dir 	=> RESET_dir,
						CtrCount4	=> CtrCount4,
						Control_NN	=>	Control_NN,
						wren			=> wren);
		
													
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
		wren_out <= wren;
		
END ARCHITECTURE	functional;