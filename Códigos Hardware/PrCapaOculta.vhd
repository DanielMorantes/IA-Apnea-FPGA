LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY PrCapaOculta IS  
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			qRAMPares			:		IN		STD_LOGIC_VECTOR(18 DOWNTO 0);
			qRAMImpares			:		IN		STD_LOGIC_VECTOR(18 DOWNTO 0);
			rdaddress_Capa2	:		IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			rden_2				:		IN 	STD_LOGIC;			
			F_dir					:		IN		STD_LOGIC;
			RESET_dir2			:		IN		STD_LOGIC;
			
			rdenRAMMP			:		OUT	STD_LOGIC;
			rdaddress			:		OUT	STD_LOGIC_VECTOR(4 DOWNTO 0);
			nContCapa2			:		OUT	STD_LOGIC;
			Reloj_out			:		OUT	STD_LOGIC;
			Reset_out_ext		:		OUT 	STD_LOGIC;
			qRAM2Capa			:		OUT	STD_LOGIC_VECTOR (34 DOWNTO 0));
	      

END ENTITY PrCapaOculta;

ARCHITECTURE functional OF PrCapaOculta IS

	SIGNAL 	AUX					:		STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	n_ContCapa1			:		STD_LOGIC;
	SIGNAL	n_ReLU				:		STD_LOGIC;
	SIGNAL	GapTiempos			:		STD_LOGIC;
	SIGNAL	DirRAM				:		STD_LOGIC;
	SIGNAL	DirROM				:		STD_LOGIC;				
	SIGNAL	ctr8count			:		STD_LOGIC;
	SIGNAL	ResetRegTemp		:		STD_LOGIC;
	SIGNAL	n_ReLUCapa1			:		STD_LOGIC;
	SIGNAL	n_memorias			:		STD_LOGIC;
	SIGNAL	n_RegMemorias		:		STD_LOGIC;
	SIGNAL	n_RegTemp			:		STD_LOGIC;
	SIGNAL	RESET_DIR			:		STD_LOGIC;
	SIGNAL	rden					:		STD_LOGIC;
	SIGNAL	Ctr_CountGap  		:		STD_LOGIC;
	SIGNAL	ResetRegRAM 		:		STD_LOGIC;
	--SIGNAL	nContCapa2			:		STD_LOGIC;
	SIGNAL	wren2 				:		STD_LOGIC;
	SIGNAL	nDir2					:		STD_LOGIC;
	
	--pp
	SIGNAL 	ROMaddress			:  STD_LOGIC_VECTOR (8 DOWNTO 0);
	
	SIGNAL	qROMPares			: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	SIGNAL	qROMImpares			: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	SIGNAL	n8byt					: STD_LOGIC;
	
				
	SIGNAL	RAMParesOUT				:	STD_LOGIC_VECTOR (18 DOWNTO 0);
	SIGNAL	RAMImparesOUT			:	STD_LOGIC_VECTOR (18 DOWNTO 0);
	
	
	SIGNAL	ROMParesOUT				:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL	ROMImparesOUT			:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	SIGNAL	ResultMultPares		:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	SIGNAL	ResultMultPares_aux	:	STD_LOGIC_VECTOR (33 DOWNTO 0);
	
	SIGNAL	ResultMultImpares		:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	SIGNAL	ResultMultImpares_aux:	STD_LOGIC_VECTOR (33 DOWNTO 0);
	
	SIGNAL	ResultSumPares			:	STD_LOGIC_VECTOR (33 DOWNTO 0);
	SIGNAL	ResultSumImpares		:	STD_LOGIC_VECTOR (33 DOWNTO 0);
	
	SIGNAL	RegTemp_OUTPares		:	STD_LOGIC_VECTOR (33 DOWNTO 0);
	SIGNAL	RegTemp_OUTImpares	:	STD_LOGIC_VECTOR (33 DOWNTO 0);
	
	SIGNAL	ResultSumTotal			:	STD_LOGIC_VECTOR (34 DOWNTO 0);
	
	SIGNAL	ReLUOUTCapa1			:	STD_LOGIC_VECTOR (34 DOWNTO 0);
	
	--SIGNAL	rdaddress_Capa2		: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL	wraddress_Capa2		: STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	SIGNAL	F_Dir2					: STD_LOGIC;
	
BEGIN
		
		control_Pr_Capa: ENTITY work.control_Pr_Capa
		PORT MAP (	clk					=> clk,
						rst					=> RESET,
						n_ContCapa1			=> n_ContCapa1,
						n_ReLU				=> n_ReLU,
						F_dir					=> F_dir,
						GapTiempos			=> GapTiempos,
						DirRAM				=> DirRAM,
						DirROM				=> DirROM,
				
						ctr8count			=> ctr8count,
						ResetRegTemp		=>	ResetRegTemp,
						n_ReLUCapa1			=> n_ReLUCapa1,
						n_memorias			=> n_memorias,
						n_RegMemorias		=> n_RegMemorias,
						n_RegTemp			=> n_RegTemp,
						RESET_DIR			=> RESET_DIR,
						rden					=> rden,
						Ctr_CountGap  		=> Ctr_CountGap,
						ResetRegRAM 		=> ResetRegRAM,
						nContCapa2			=> nContCapa2,
						wren2 				=> wren2,
						nDir2					=> nDir2);
							
							
		DirRdRAM: ENTITY work.DirRdRAM
		PORT MAP (	clk    		=> clk,
						n_memorias	=> n_memorias,
						RESET			=> RESET,
						rdaddress	=> rdaddress,
						DirRAM		=> DirRAM);
						
		DirRdROM: ENTITY work.DirRdROM
		PORT MAP (	clk    		=> clk,
						n_memorias	=> n_memorias,
						RESET			=> RESET,
						rdaddress	=> ROMaddress,
						DirROM		=> DirROM);		
		
		ROMPares: ENTITY work.ROMPares
		PORT MAP ( 	address		=> ROMaddress,
						clock			=> clk,
						rden			=> rden,	
						q				=> qROMPares);
		
		
		ROMImpares: ENTITY work.ROMImpares
		PORT MAP ( 	address		=> ROMaddress,
						clock			=> clk,
						rden			=> rden,	
						q				=> qROMImpares);
		
		RegOutRAM: ENTITY work.RegOutRAM
		PORT MAP (	clk			 => clk,
						ResetRegRAM	 => ResetRegRAM,
						n8byt			 => n_RegMemorias,
						qRAMPares	 => qRAMPares,
						qRAMImpares	 => qRAMImpares,
						
						ParesOUT		 => RAMParesOUT,
						ImparesOUT	 => RAMImparesOUT);						

		RegOutROM: ENTITY work.RegOutROM
		PORT MAP (	clk			 => clk,
						Reset			 => RESET,
						n8byt			 => n_RegMemorias,
						qROMPares	 => qROMPares,
						qROMImpares	 => qROMImpares,
						
						ROMParesOUT		 => ROMParesOUT,
						ROMImparesOUT	 => ROMImparesOUT);		
						
		MultiplicadorPares: ENTITY work.Multiplicador
		PORT MAP (	datab		=> ROMParesOUT,
						dataa		=> RAMParesOUT,
						result	=> ResultMultPares);	
			
		MultiplicadorImpares: ENTITY work.Multiplicador
		PORT MAP (	datab		=> ROMImparesOUT,
						dataa		=> RAMImparesOUT,
						result	=> ResultMultImpares);	
			
		SumadorPares: ENTITY work.Sumador
		PORT MAP (	data0x	=> ResultMultPares_aux,				
						data1x	=> RegTemp_OUTPares,
						result	=> ResultSumPares);
						
		SumadorImpares: ENTITY work.Sumador
		PORT MAP (	data0x	=> ResultMultImpares_aux,			
						data1x	=> RegTemp_OUTImpares,
						result	=> ResultSumImpares);
						
		RegTempPares: ENTITY work.RegTemp
		PORT MAP (		clk			=> clk,
							n_Res			=> ResetRegTemp,
							nRegTemp		=> n_RegTemp,
							SumadorOUT	=> ResultSumPares,
							
							RegTemp_OUT	=> RegTemp_OUTPares);
		
		RegTempImpares: ENTITY work.RegTemp
		PORT MAP (		clk			=> clk,
							n_Res			=> ResetRegTemp,
							nRegTemp		=> n_RegTemp,
							SumadorOUT	=> ResultSumImpares,
							
							RegTemp_OUT	=> RegTemp_OUTImpares);
		
		SumadorTotal: ENTITY work.SumadorTotal
		PORT MAP (	data0x		=> RegTemp_OUTPares,
						data1x		=> RegTemp_OUTImpares,
						result		=> ResultSumTotal);
						
		ReLU: ENTITY work.reLUCapa1
		PORT MAP (	clk 	=> clk,
						rst 	=> RESET,
						ena 	=> n_ReLUCapa1,
						d 	 	=> ResultSumTotal,
						q 		=> ReLUOUTCapa1);
						
		RAM2Capa: ENTITY work.RAM2Capa
		PORT MAP (	clock			=> clk,
						data			=> ReLUOUTCapa1,
						rdaddress	=> rdaddress_Capa2,
						rden			=> rden_2,
						wraddress	=> wraddress_Capa2,
						wren			=> wren2,
						q				=> qRAM2Capa);
						
		Direcciones2Capa: ENTITY work.Direcciones2Capa
		PORT MAP (	clk    		=> clk,
						ctrDir2		=> nDir2,
						RESET_dir	=> RESET_dir2,
						wraddress   => wraddress_Capa2,
						F_Dir2		=> F_Dir2);
				 				  		   						
																	
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
		
		rdenRAMMP <= rden;
		AUX <= "0000000";
		ResultMultPares_aux	<= (AUX & ResultMultPares);
		ResultMultImpares_aux	 	<= (AUX & ResultMultImpares);
		
END ARCHITECTURE	functional;