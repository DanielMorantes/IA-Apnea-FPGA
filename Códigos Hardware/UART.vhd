LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY UART IS 
	PORT( clk					:		IN 	STD_LOGIC;
			RESET 				: 		IN		STD_LOGIC;
			Bit_entrada			:		IN		STD_LOGIC;
			--Control_NN			:		OUT	STD_LOGIC;
			C_Abdom				:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			F_Aire				:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			PPG					:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			C_Toracico			:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			I_Ronquido			:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			SPO2					:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			C4_A1					:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			O2_A1					:		OUT	STD_LOGIC_VECTOR(7 downto 0);
			reloj_out			:		OUT	STD_LOGIC;
			Reset_out_ext		:		OUT 	STD_LOGIC;
			Bit_entrada_out	:		OUT   STD_LOGIC;
			Pepito_out 			:		OUT 	STD_LOGIC_VECTOR(7 downto 0);
			nRegCorr_out		:		OUT	STD_LOGIC;
			nRegPar_out			:		OUT	STD_LOGIC;
			FLAG1_out			:		OUT 	STD_LOGIC;
			FLAG2_out			:		OUT	STD_LOGIC;
			FLAG3_out			:		OUT	STD_LOGIC;
			estado				:		OUT	STD_LOGIC_VECTOR(2 downto 0));
	      

END ENTITY UART;

ARCHITECTURE	functional OF UART IS

	SIGNAL	Ctr_Count1    		: STD_LOGIC;
	SIGNAL   Ctr_Count2    		: STD_LOGIC;
	SIGNAL   Count1_Ctr_1  		: STD_LOGIC;
	SIGNAL 	Count1_Ctr_2  		: STD_LOGIC;
	SIGNAL   Count2_Ctr    		: STD_LOGIC;
	SIGNAL   Ctr_Reg       		: STD_LOGIC;
	SIGNAL   Bit_entrada_Byte	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	S1						: STD_LOGIC_VECTOR(12 downto 0);
	SIGNAL	S2						: STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL   FLAG1       		: STD_LOGIC;
	SIGNAL   FLAG2       		: STD_LOGIC;
	SIGNAL   FLAG3       		: STD_LOGIC;
	SIGNAL	nRegCorr				: STD_LOGIC;
	SIGNAL   nRegPar				: STD_LOGIC;
	SIGNAL	RESET_C1 			: STD_LOGIC;
	SIGNAL   RESET_C2				: STD_LOGIC;
	SIGNAL   n_Res					: STD_LOGIC;
	SIGNAL	Registro_8_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_7_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_6_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_5_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_4_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_3_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_2_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_1_IN		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Registro_1_OUT		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Reset_out			: STD_LOGIC;
	--SIGNAL	S3						: STD_LOGIC_VECTOR(2 downto 0);
		
	
BEGIN
		
		control_uart: ENTITY work.control_uart
		PORT MAP (	clk					=> clk,
						RESET					=> RESET,
						Bit_entrada			=> Bit_entrada,
						FLAG1 				=> FLAG1,
						FLAG2	   			=> FLAG2,
						FLAG3 				=> FLAG3,
						Ctr_Count1			=> Ctr_Count1,
						RESET_C1				=> RESET_C1,
						RESET_C2				=> RESET_C2,
						nRegCorr				=> nRegCorr,
						nRegPar				=> nRegPar,
						Ctr_Count2			=> Ctr_Count2,
						--Control_NN			=>	Control_NN,
						estado				=> estado);
						--Bit_entrada_byte	=> Bit_entrada_byte);
						--ena_registro_TRES	=>  ;
						
		contador1: ENTITY work.contador1
		PORT MAP (	clk    		=> clk,
						Ctr_Count1	=> Ctr_Count1,
						RESET_C1			=> RESET_C1,
						S1          => S1,
						FLAG1			=> FLAG1,
						FLAG2			=> FLAG2);

						
		contador2: ENTITY work.contador2
		PORT MAP (	clk	    	=> clk,
						Ctr_Count2	=> Ctr_Count2,
						RESET_C2			=> RESET_C2,
						n_Res       => n_Res,
						S2          => S2,
						FLAG3			=> FLAG3,
						Reloj_out	=> Reloj_out,
						reset_out	=> reset_out);						

--		contador3: ENTITY work.contador3
--		PORT MAP (	clk    		=> clk,
--						FLAG3			=> FLAG3,
--						RESET			=> RESET,
--						S3          => S3,
--						FLAG4			=> FLAG4,
--						Reloj_out	=> Reloj_out,
--						reset_out	=> reset_out);	

	
		RegistroDeCorrimientos: ENTITY work.RegistroDeCorrimientos
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegCorr			=> nRegCorr,
						Bit_entrada		=> Bit_entrada,
						Registro_8_IN 	=> Registro_8_IN);	
						
		Registro_8: ENTITY work.Registro_8
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_8_IN 	=> Registro_8_IN,
						Registro_7_IN	=> Registro_7_IN);	
						
		Registro_7: ENTITY work.Registro_7
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_7_IN	=> Registro_7_IN,
						Registro_6_IN 	=> Registro_6_IN);
						
		Registro_6: ENTITY work.Registro_6
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_6_IN	=> Registro_6_IN,
						Registro_5_IN 	=> Registro_5_IN);
						
		Registro_5: ENTITY work.Registro_5
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_5_IN	=> Registro_5_IN,
						Registro_4_IN 	=> Registro_4_IN);
						
		Registro_4: ENTITY work.Registro_4
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_4_IN	=> Registro_4_IN,
						Registro_3_IN 	=> Registro_3_IN);
						
		Registro_3: ENTITY work.Registro_3
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_3_IN	=> Registro_3_IN,
						Registro_2_IN 	=> Registro_2_IN);
						
		Registro_2: ENTITY work.Registro_2
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_2_IN	=> Registro_2_IN,
						Registro_1_IN 	=> Registro_1_IN);
						
		Registro_1: ENTITY work.Registro_1
		PORT MAP (	clk    			=> clk,
						n_Res				=> n_Res,
						nRegPar				=> nRegPar,
						Registro_1_IN	=> Registro_1_IN,
						Registro_1_OUT	=> Registro_1_OUT);
				 				  		   						
																	
		Reloj_out <= clk;
		Reset_out_ext <= RESET;
		
		O2_A1 <= Registro_7_IN;
		C4_A1 <= Registro_6_IN;
		SPO2 	<= Registro_5_IN;
		I_Ronquido <= Registro_4_IN;
		C_Toracico <= Registro_3_IN;
		PPG	<= Registro_2_IN; 
		F_Aire <= Registro_1_IN;
		C_Abdom <= Registro_1_OUT;
		Bit_entrada_out <= bit_entrada;
		Pepito_out <= Registro_7_IN;
		nRegCorr_out <= nRegCorr;
		nRegPar_out <= nRegPar;
		FLAG1_out <= FLAG1;
	   FLAG2_out <= FLAG2;
		FLAG3_out <= FLAG3;

		
END ARCHITECTURE	functional;