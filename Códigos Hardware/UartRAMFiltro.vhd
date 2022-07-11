LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY UartRAMFiltro IS 
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			Bit_entrada			:		IN		STD_LOGIC;			
			
			
			n_Max_Pooling	:		OUT	STD_LOGIC;
			n_8byt			:		out	std_LOGIC;
			Filt_OUT			:		OUT	STD_LOGIC_VECTOR(18 downto 0);
			Reset_out_ext	:		OUT 	STD_LOGIC;
			Reloj_out		:		OUT	STD_LOGIC
			);
			
END ENTITY UartRAMFiltro;

ARCHITECTURE	functional OF UartRAMFiltro IS

	SIGNAL	clock    		 	: 	STD_LOGIC;
	SIGNAL   data	    			: 	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL 	rst_Control			:	STD_LOGIC;
	SIGNAL	Abd					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Ronc					:	STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL	SPO_2					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	C4_A1					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	O2_A1					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	PPG					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	FLA					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	torac					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	n_Control_Conv		:	STD_LOGIC; --Enable Control	
	SIGNAL	address_Ram		:		STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL	ena_RAM_1		:		STD_LOGIC; --Enables RAM's entrada
	SIGNAL	ena_RAM_2		:		STD_LOGIC;
	SIGNAL	ena_RAM_3		:		STD_LOGIC;
	SIGNAL	ena_RAM_4		:		STD_LOGIC;
	SIGNAL	ena_RAM_5		:		STD_LOGIC;
	SIGNAL	ena_RAM_6		:		STD_LOGIC;
	SIGNAL	ena_RAM_7		:		STD_LOGIC;
	SIGNAL	ena_RAM_8		:		STD_LOGIC;
	
	SIGNAL 	Bit_entrada_out	: STD_LOGIC;
	SIGNAL	qAbdom				: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qF_Aire				: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qPPG					: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qTorax				: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qI_Ronq				: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qSPO2					: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qC4A1					: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qO2A1					: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	pepita_out			: STD_LOGIC_VECTOR (7 DOWNTO 0);
	--SIGNAL	Reset_out_ext		: STD_LOGIC;
	--SIGNAL	Reloj_out			: STD_LOGIC;
	SIGNAL 	Control_NN			: STD_LOGIC;
	SIGNAL	wren_out				: STD_LOGIC;
	SIGNAL  	Reset_UART			: STD_LOGIC;	
	
BEGIN
		
		UartConRAMs: ENTITY work.UartRecepcion
		PORT MAP (	clk 					=> clk,
						RESET					=> RESET,
						Bit_entrada			=> Bit_entrada,
						rdaddress			=> address_Ram,
						ena_RAM_1			=> ena_RAM_1,
						ena_RAM_2			=> ena_RAM_2,
						ena_RAM_3			=> ena_RAM_3,
						ena_RAM_4			=> ena_RAM_4,
						ena_RAM_5			=> ena_RAM_5,
						ena_RAM_6			=> ena_RAM_6,
						ena_RAM_7			=> ena_RAM_7,
						ena_RAM_8			=> ena_RAM_8,
						Bit_entrada_out	=> Bit_entrada_out,
						qAbdom				=> qAbdom,
						qF_Aire				=> qF_Aire,
						qPPG					=> qPPG,
						qTorax				=> qTorax,
						qI_Ronq				=> qI_Ronq,
						qSPO2					=> qSPO2,
						qC4A1					=> qC4A1,
						qO2A1					=> qO2A1,
						pepita_out			=> pepita_out,
						Reset_out_ext		=> Reset_out_ext,
						Reloj_out			=> Reloj_out,
						Control_NN			=> Control_NN,
						wren_out				=> wren_out);
						
		CapaConvolucional: ENTITY work.Filtro_conv
		PORT MAP (	clk				=> clk,
						rst_Control		=> RESET_UART,
						Abd				=> qAbdom,
						Ronc				=> qI_Ronq,
						SPO_2				=> qSPO2,
						C4_A1				=> qC4A1,
						O2_A1				=> qO2A1,
						PPG				=> qPPG,
						FLA				=> qF_Aire,
						torac				=> qTorax,
						
						n_Control_Conv	=> Control_NN,
						
						address_Ram		=> address_Ram,

						ena_RAM_1		=> ena_RAM_1,
						ena_RAM_2		=> ena_RAM_2,
						ena_RAM_3		=> ena_RAM_3,
						ena_RAM_4		=> ena_RAM_4,
						ena_RAM_5		=> ena_RAM_5,
						ena_RAM_6		=> ena_RAM_6,
						ena_RAM_7		=> ena_RAM_7,
						ena_RAM_8		=> ena_RAM_8,
						
						n_8byt			=> n_8byt,
						
						n_Max_Pooling	=> n_Max_Pooling,
						
						Filt_OUT			=> Filt_OUT);				
					
		
													
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
		Reset_UART <= not RESET;
				
END ARCHITECTURE	functional;