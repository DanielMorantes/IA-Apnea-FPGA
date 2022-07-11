LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY SeCapaOculta IS  
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			n_ContCapa2			:		IN		STD_LOGIC;
			qRAM2CApa			:		IN		STD_LOGIC_VECTOR(34 DOWNTO 0);
			
			Reloj_out			:		OUT	STD_LOGIC;
			Reset_out_ext		:		OUT 	STD_LOGIC;
			RESET_dir2RAM 		:		OUT	STD_LOGIC;
			rdaddress2capa		:		OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			rden_2				:		OUT 	STD_LOGIC;
			nsoftmax				:		OUT	STD_LOGIC;
			Apnea_OUT			:		OUT	STD_LOGIC);
	      

END ENTITY SeCapaOculta;

ARCHITECTURE functional OF SeCapaOculta IS

	
	SIGNAL 	AUX					:		STD_LOGIC;
	--Señales de control
	SIGNAL	F_dir_Capa2			:		STD_LOGIC;
	SIGNAL	rden2					:		STD_LOGIC;
	SIGNAL	n_RegTemp2Capa			:		STD_LOGIC;
	SIGNAL	n_memorias2			:		STD_LOGIC;
	SIGNAL	n_softmax			:		STD_LOGIC;
	SIGNAL   RESET_dir2			:		STD_LOGIC;	
	SIGNAL	ResetRegTempCapa2 :		STD_LOGIC;
	
	--Señales del contador
	SIGNAL	rdaddress2capa_aux  	:  std_logic_vector(3 downto 0);
	
				
	SIGNAL	qROMSiHayApnea				:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	qROMNoHayApnea			:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	SIGNAL	ResultNoHay		:	STD_LOGIC_VECTOR (42 DOWNTO 0);
	SIGNAL	ResultNoHay_aux	:	STD_LOGIC_VECTOR (43 DOWNTO 0);
	
	SIGNAL	ResultSiHay		:	STD_LOGIC_VECTOR (42 DOWNTO 0);
	SIGNAL	ResultSiHay_aux :	STD_LOGIC_VECTOR (43 DOWNTO 0);
	
	SIGNAL	ResultSumSiHay			:	STD_LOGIC_VECTOR (43 DOWNTO 0);
	SIGNAL	ResultSumNoHay			:	STD_LOGIC_VECTOR (43 DOWNTO 0);
	
	SIGNAL	Neurona1		:	STD_LOGIC_VECTOR (43 DOWNTO 0);
	SIGNAL	Neurona2		:	STD_LOGIC_VECTOR (43 DOWNTO 0);
	
	
	
BEGIN
		
		control_Se_Capa: ENTITY work.control_se_Capa
		PORT MAP (	clk					=> clk,
						rst					=> RESET,
						n_ContCapa2			=> n_ContCapa2,
						F_dir_Capa2			=> F_dir_Capa2,
										
						rden2					=> rden2,
						n_RegTemp2			=> n_RegTemp2Capa,
						n_memorias2			=> n_memorias2,
						n_softmax			=> n_softmax,
						RESET_dir2			=> RESET_dir2,
						ResetRegTempCapa2 => ResetRegTempCapa2);
							
							
		RdDirCount: ENTITY work.RdRAMCount
		PORT MAP (	clk    		=> clk,
						ctrDir2		=> n_memorias2,
						RESET_dir	=> RESET_dir2,
						rdaddress2capa  => rdaddress2capa_aux,
						F_Dir2		=> F_dir_Capa2);
						
			
		
		ROMNeurona1: ENTITY work.ROMSiHayApnea
		PORT MAP ( 	address		=> rdaddress2capa_aux,
						clock			=> clk,
						rden			=> rden2,	
						q				=> qROMSiHayApnea);
		
		
		ROMNeurona2: ENTITY work.ROMNoHayApnea
		PORT MAP ( 	address		=> rdaddress2capa_aux,
						clock			=> clk,
						rden			=> rden2,	
						q				=> qROMNoHayApnea);
		
		MultiplicadorNeurona1: ENTITY work.Mult1Capa2
		PORT MAP (	datab		=> qRAM2CApa,
						dataa		=> qROMSiHayApnea,
						result	=> ResultSiHay);	
			
		MultiplicadorNeurona2: ENTITY work.Mult1Capa2
		PORT MAP (	datab		=> qRAM2CApa,
						dataa		=> qROMNoHayApnea,
						result	=> ResultNoHay);
			
		SumadorSiHay: ENTITY work.Sum1Capa2
		PORT MAP (	data0x	=> ResultSiHay_aux,				
						data1x	=> Neurona1,
						result	=> ResultSumSiHay);
						
		SumadorImpares: ENTITY work.Sum1Capa2
		PORT MAP (	data0x	=> ResultNoHay_aux,			
						data1x	=> Neurona2,
						result	=> ResultSumNoHay);
						
		RegTempCapa2: ENTITY work.RegTempCapa2
		PORT MAP (	clk			 		 => clk,
						ResetRegTempCapa2	 => ResetRegTempCapa2,
						n_RegTemp2Capa		 => n_RegTemp2Capa,
						SumNeurona1		 	 => ResultSumSiHay,
						SumNeurona2	 		 => ResultSumNoHay,
						
						Neurona1		 		 => Neurona1,
						Neurona2	 			 => Neurona2);						
						
								
		Softmax: ENTITY work.softmax
		PORT MAP (	clk 	=> clk,
						RESET 	=> RESET,
						n_softmax 	=> n_softmax,
						Neurona1 	 	=> Neurona1,
						Neurona2 	 	=> Neurona2,
						Apnea_OUT 		=> Apnea_OUT);
						
				 				  		   						
																	
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
		
		AUX <= '0';
		ResultSiHay_aux	<= (AUX & ResultSiHay);
		ResultNoHay_aux	<= (AUX & ResultNoHay);
		
		rdaddress2capa <= rdaddress2capa_aux;
		rden_2 <= rden2;
		RESET_dir2RAM <= RESET_dir2;
		nsoftmax <= n_softmax;
		
END ARCHITECTURE	functional;