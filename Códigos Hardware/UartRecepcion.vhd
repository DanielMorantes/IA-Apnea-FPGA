LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY UartRecepcion IS 
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			Bit_entrada			:		IN		STD_LOGIC;
			rdaddress			:		IN		STD_LOGIC_VECTOR(4 DOWNTO 0);
			ena_RAM_1			:		IN		STD_LOGIC; --Enables RAM's entrada
			ena_RAM_2			:		IN		STD_LOGIC;
			ena_RAM_3			:		IN		STD_LOGIC;
			ena_RAM_4			:		IN		STD_LOGIC;
			ena_RAM_5			:		IN		STD_LOGIC;
			ena_RAM_6			:		IN		STD_LOGIC;
			ena_RAM_7			:		IN		STD_LOGIC;
			ena_RAM_8			:		IN		STD_LOGIC;
			Bit_entrada_out	: 		OUT 	STD_LOGIC;
			qAbdom				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qF_Aire				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qPPG					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qTorax				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qI_Ronq				:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qSPO2					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qC4A1					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			qO2A1					:		OUT 	STD_LOGIC_VECTOR (7 DOWNTO 0);
			pepita_out			:		OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
			Reset_out_ext		:		OUT  	STD_LOGIC;
			Reloj_out			:		OUT	STD_LOGIC;
			Control_NN			: 		OUT	STD_LOGIC;
			wren_out				: 		OUT 	STD_LOGIC) ;
	      

END ENTITY UartRecepcion;

ARCHITECTURE	functional OF UartRecepcion IS

	SIGNAL	clock    		 	: STD_LOGIC;
	SIGNAL   data	    			: STD_LOGIC_VECTOR (7 DOWNTO 0);
	--SIGNAL 	Control_NN			: STD_LOGIC;
	SIGNAL	C_Abdom				: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	F_Aire				: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	PPG					: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	C_Toracico			: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	I_Ronquido			: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	SPO2					: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	C4_A1					: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	O2_A1					: STD_LOGIC_VECTOR(7 downto 0);
	--SIGNAL	reloj_out			: STD_LOGIC;
	--SIGNAL	Reset_out_ext		: STD_LOGIC;
	--SIGNAL	Bit_entrada_out	: STD_LOGIC;
	SIGNAL	Pepito_out 			: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	nRegCorr_out		: STD_LOGIC;
	SIGNAL	nRegPar_out			: STD_LOGIC;
	SIGNAL	FLAG1_out			: STD_LOGIC;
	SIGNAL	FLAG2_out			: STD_LOGIC;
	SIGNAL	FLAG3_out			: STD_LOGIC;
	SIGNAL	estado				: STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL 	nRegPar				: STD_LOGIC;
	--SIGNAL	rdaddress	  		: STD_LOGIC_VECTOR (4 DOWNTO 0);
	--SIGNAL	rden			  		: STD_LOGIC;
	SIGNAL	Registro_7_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_6_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_5_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_4_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_3_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_2_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_1_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_1_OUT		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL  	Reset_UART			: STD_LOGIC;
		
	
BEGIN
		
		UART: ENTITY work.UART
		PORT MAP (	clk 					=> clk,
						RESET					=> Reset_UART,
						Bit_entrada			=> Bit_entrada,
						C_Abdom	   		=> C_Abdom,
						F_Aire 				=> F_Aire,
						PPG					=> PPG,
						C_Toracico			=> C_Toracico,
						I_Ronquido			=> I_Ronquido,
						SPO2					=> SPO2,
						C4_A1					=> C4_A1,
						O2_A1		 			=> O2_A1,
						reloj_out	   	=> reloj_out,
						Reset_out_ext		=> Reset_out_ext,
						Bit_entrada_out	=> Bit_entrada_out,
						Pepito_out			=> Pepito_out,
						nRegCorr_out		=> nRegCorr_out,
						nRegPar_out		 	=> nRegPar_out,
						FLAG1_out	   	=> FLAG1_out,
						FLAG2_out			=> FLAG2_out,
						FLAG3_out			=> FLAG3_out,
						estado				=> estado);
						
		Memoria: ENTITY work.Memoria
		PORT MAP (	clk					=> clk,
						RESET					=> RESET,
						nRegPar				=> nRegPar_out,
						rdaddress 			=> rdaddress,
						Registro_7_IN 		=> Registro_7_IN,
						Registro_6_IN		=> Registro_6_IN,
						Registro_5_IN		=> Registro_5_IN,
						Registro_4_IN		=> Registro_4_IN,
						Registro_3_IN		=> Registro_3_IN,
						Registro_2_IN		=> Registro_2_IN,
						Registro_1_IN 		=> Registro_1_IN,
						Registro_1_OUT		=> Registro_1_OUT,
						ena_RAM_1			=> ena_RAM_1,
						ena_RAM_2			=> ena_RAM_2,
						ena_RAM_3			=> ena_RAM_3,
						ena_RAM_4			=> ena_RAM_4,
						ena_RAM_5			=> ena_RAM_5,
						ena_RAM_6			=> ena_RAM_6,
						ena_RAM_7			=> ena_RAM_7,
						ena_RAM_8			=> ena_RAM_8,
						qAbdom		 		=> qAbdom,
						qF_Aire				=> qF_Aire,
						qPPG					=> qPPG,
						qTorax				=> qTorax,
						qI_Ronq				=> qI_Ronq,
						qSPO2 				=> qSPO2,
						qC4A1					=> qC4A1,
						qO2A1		 			=> qO2A1,
						Control_NN 			=> Control_NN,
						Reset_out_ext		=> Reset_out_ext,
						Reloj_out			=> Reloj_out,
						wren_out				=> wren_out);				
		
		
													
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
		Bit_entrada_out <= Bit_entrada;
		Reset_UART <= not RESET;
		
		Registro_7_IN 		<= C_abdom;
		Registro_6_IN		<= F_aire;
		Registro_5_IN		<= PPG;
		Registro_4_IN		<= C_toracico;
		Registro_3_IN		<= I_Ronquido;
		Registro_2_IN		<= SPO2;
		Registro_1_IN 		<= C4_A1;
		Registro_1_OUT		<= O2_A1;
		
		pepita_out <= Registro_7_IN;
		
END ARCHITECTURE	functional;