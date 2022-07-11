LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY CNNCompleta IS 
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			Bit_entrada			:		IN		STD_LOGIC;			
			
			Reset_out_ext		:		OUT 	STD_LOGIC;
			Reloj_out			:		OUT	STD_LOGIC;
			nsoftmax				:		OUT	STD_LOGIC;
			Apnea_OUT			: 		OUT	STD_LOGIC
			);
			
END ENTITY CNNCompleta;

ARCHITECTURE	functional OF CNNCompleta IS

	SIGNAL	n_Max_Pooling		:		STD_LOGIC;
	SIGNAL	n_8byt				:		std_LOGIC;
	SIGNAL	Filt_OUT				:		STD_LOGIC_VECTOR(18 downto 0);
		
	SIGNAL 	n8byt					:		STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
	--SIGNAL	Filt_Out				:		STD_LOGIC_VECTOR (18 DOWNTO 0);
	SIGNAL	rdaddressPar		:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL	rdaddressImpar		:		STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL	rden					:		STD_LOGIC;
	
	SIGNAL 	rdenRAMMP			:		STD_LOGIC;
	SIGNAL 	F_dirMPtoC1			:		STD_LOGIC;
	
	SIGNAL 	qRAMPares			:		STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	qRAMImpares			:		STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	rden_2				:		STD_LOGIC;			
	SIGNAL	F_dir					:		STD_LOGIC;
	SIGNAL	RESET_dir2			:		STD_LOGIC;
			
	SIGNAL	rdaddress			:		STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL	nContCapa2			:		STD_LOGIC;
	--SIGNAL	Reloj_out			:		STD_LOGIC;
	--SIGNAL	Reset_out_ext		:		STD_LOGIC;
	SIGNAL	qRAM2Capa			:		STD_LOGIC_VECTOR (34 DOWNTO 0);
	
	SIGNAL 	rdaddress2capa		:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	RESET_dir2RAM		:		STD_LOGIC;
	
BEGIN
		
		UartRAMFiltro: ENTITY work.UartRAMFiltro
		PORT MAP (	clk 					=> clk,
						RESET 				=> RESET,
						Bit_entrada			=> Bit_entrada,	
						
						
						n_Max_Pooling		=> n_Max_Pooling,
						n_8byt				=> n_8byt,	
						Filt_OUT				=> Filt_OUT,
						Reset_out_ext		=> Reset_out_ext,
						Reloj_out			=> Reloj_out);
						
		MaxPooling: ENTITY work.RegistrosRAM	
		PORT MAP (  clk					=> clk,
						Reset					=> RESET,
						n8byt					=> n_8byt,
						Filt_Out				=> Filt_OUT,
						rdaddressPar		=> rdaddress,
						rdaddressImpar		=> rdaddress,
						rden					=> rdenRAMMP,
						
						F_dirMPtoC1			=>	F_dirMPtoC1,
						qRAMPares			=> qRAMPares,
						qRAMImpares			=> qRAMImpares);
						
						
		PrimeraCapaOculta: ENTITY work.PrCapaOculta
		PORT MAP (	clk					=> clk,
						RESET 				=> RESET,
						qRAMPares			=> qRAMPares,
						qRAMImpares			=> qRAMImpares,
						rdaddress_Capa2	=> rdaddress2capa,
						rden_2				=> rden_2,
						F_dir					=> F_dirMPtoC1,
						RESET_dir2			=> RESET_dir2RAM,
						
						rdenRAMMP			=>	rdenRAMMP,
						rdaddress			=> rdaddress,
						nContCapa2			=> nContCapa2,
						Reloj_out			=> Reloj_out,
						Reset_out_ext		=> Reset_out_ext,
						qRAM2Capa			=> qRAM2Capa);	
			

		SegundaCapaOculta: ENTITY work.SeCapaOculta
		PORT MAP (	clk					=> clk,
						RESET 				=> RESET,
						n_ContCapa2			=> nContCapa2,
						qRAM2Capa			=> qRAM2Capa,
						
						Reloj_out			=> Reloj_out,
						Reset_out_ext		=> Reset_out_ext,
						RESET_dir2RAM		=>	RESET_dir2RAM,
						rdaddress2capa		=> rdaddress2capa,
						rden_2				=> rden_2,
						nsoftmax				=>	nsoftmax,
						Apnea_OUT			=> Apnea_OUT);	
					
		
													
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
						
END ARCHITECTURE	functional;