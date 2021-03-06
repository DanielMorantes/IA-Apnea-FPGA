	LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY altera;
USE altera.altera_primitives_components.all;
-------------------------------------------
ENTITY Filtro_conv IS 
	PORT( clk				:		IN 	STD_LOGIC := '1';
			rst_Control		:		IN		STD_LOGIC;
			Abd				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Ronc				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);	
			SPO_2				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			C4_A1				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			O2_A1				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			PPG				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			FLA				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			torac				:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			n_Control_Conv	:		IN		STD_LOGIC; --Enable Control
			
			address_Ram		:		OUT	STD_LOGIC_VECTOR(4 DOWNTO 0);

			ena_RAM_1		:		OUT	STD_LOGIC; --Enables RAM's entrada
			ena_RAM_2		:		OUT	STD_LOGIC;
			ena_RAM_3		:		OUT	STD_LOGIC;
			ena_RAM_4		:		OUT	STD_LOGIC;
			ena_RAM_5		:		OUT	STD_LOGIC;
			ena_RAM_6		:		OUT	STD_LOGIC;
			ena_RAM_7		:		OUT	STD_LOGIC;
			ena_RAM_8		:		OUT	STD_LOGIC;
			
			n_8byt			:		OUT 	STD_LOGIC;
			
			n_Max_Pooling	:		OUT	STD_LOGIC; --n_8_byte 
			
			
			Filt_OUT			:		OUT	STD_LOGIC_VECTOR(18 downto 0)
	);

END ENTITY Filtro_conv;

ARCHITECTURE	functional OF Filtro_conv IS

	SIGNAL 	AUX			: STD_LOGIC;
		
	SIGNAL	rden			:	STD_LOGIC; --Enables ROMS
			
	SIGNAL	enab_reg_ROM_1	:	STD_LOGIC; --Enables registros ROM
	SIGNAL	enab_reg_ROM_2	:	STD_LOGIC;	
	SIGNAL	enab_reg_ROM_3	:	STD_LOGIC;
	SIGNAL	enab_reg_ROM_4	:	STD_LOGIC;
	SIGNAL	enab_reg_ROM_5	:	STD_LOGIC;
	SIGNAL	enab_reg_ROM_6	:	STD_LOGIC;	
	SIGNAL	enab_reg_ROM_7	:	STD_LOGIC;
	SIGNAL	enab_reg_ROM_8	:	STD_LOGIC;
	
	SIGNAL	reg_raro_rst1	:	STD_LOGIC; --Resets Registros ROM
	SIGNAL	reg_raro_rst2	:	STD_LOGIC;
	SIGNAL	reg_raro_rst3	:	STD_LOGIC;
	SIGNAL	reg_raro_rst4	:	STD_LOGIC;
	SIGNAL	reg_raro_rst5	:	STD_LOGIC;
	SIGNAL	reg_raro_rst6	:	STD_LOGIC;
	SIGNAL	reg_raro_rst7	:	STD_LOGIC;
	SIGNAL	reg_raro_rst8	:	STD_LOGIC;
	
	SIGNAL	reg_in_ena_1	:	STD_LOGIC; --Enables registros entrada
	SIGNAL	reg_in_ena_2	:	STD_LOGIC;
	SIGNAL	reg_in_ena_3	:	STD_LOGIC;
	SIGNAL	reg_in_ena_4	:	STD_LOGIC;
	SIGNAL	reg_in_ena_5	:	STD_LOGIC;
	SIGNAL	reg_in_ena_6	:	STD_LOGIC;
	SIGNAL	reg_in_ena_7	:	STD_LOGIC;
	SIGNAL	reg_in_ena_8	:	STD_LOGIC;
	
	SIGNAL	reg_in_rst_1	:	STD_LOGIC; --Resets registros entrada
	SIGNAL	reg_in_rst_2	:	STD_LOGIC;
	SIGNAL	reg_in_rst_3	:	STD_LOGIC;
	SIGNAL	reg_in_rst_4	:	STD_LOGIC;
	SIGNAL	reg_in_rst_5	:	STD_LOGIC;
	SIGNAL	reg_in_rst_6	:	STD_LOGIC;
	SIGNAL	reg_in_rst_7	:	STD_LOGIC;
	SIGNAL	reg_in_rst_8	:	STD_LOGIC;
	
	SIGNAL	reLU_ena			:	STD_LOGIC; --RELU
	SIGNAL	reLU_rst			:	STD_LOGIC;
	
	SIGNAL	reg_Filt_ena	:	STD_LOGIC; --Enable Reg_Filtro
	SIGNAL	reg_Filt_rst	:	STD_LOGIC;
	
	SIGNAL	ctr_count_RAM			:	STD_LOGIC; --Enables contadores
	SIGNAL	ctr_count_Relu			:	STD_LOGIC;
	SIGNAL	ctr_count_Filtro		:	STD_LOGIC;
	SIGNAL	ctr_countROM_Filtro	:	STD_LOGIC;
	SIGNAL	ctr_count_Fin			:	STD_LOGIC;
	
	SIGNAL	Load_count				:	STD_LOGIC;
	
	SIGNAL   S_Count_Relu			:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL 	S_count_Relu_aux		:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL   S_Count_Filtro			:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL   S_Count_Fin				:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	SIGNAL	rst_count_RAM			:	STD_LOGIC; --Resets contadores
	SIGNAL	rst_count_Relu			:	STD_LOGIC;
	SIGNAL	rst_count_Filtro		:	STD_LOGIC;
	SIGNAL	rst_countROM_Filtro	:	STD_LOGIC;
	SIGNAL	rst_count_Fin			:	STD_LOGIC;	 
	
	SIGNAL	address_Ram_AUX		:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	SIGNAL	Flag_count_RAM			:	STD_LOGIC; --OUT comparador con 23
	SIGNAL	Flag_count_Relu		:	STD_LOGIC; --Flags contadores
	SIGNAL	Flag_count_Filtro		:	STD_LOGIC;
	SIGNAL	Flag_count_Fin			:	STD_LOGIC;
	
	--Direccion ROM
	SIGNAL	address_Rom	:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	SIGNAL	address_Rom_7	:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL	address_Rom_14	:	STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	--Se??ales para datos
	SIGNAL	res_Mul_0	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_1	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_2	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_3	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_4	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_5	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_6	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	res_Mul_7	:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	SIGNAL	res_Mul_0_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_1_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_2_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_3_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_4_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_5_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_6_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	res_Mul_7_aux	:  STD_LOGIC_VECTOR(18 DOWNTO 0);
	
	SIGNAL	Dato_0		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Dato_1		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Dato_2		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Dato_3		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Dato_4		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Dato_5		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Dato_6		:	STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL	Dato_7		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL	ROM_q1		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ROM_q2		:	STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL	ROM_q3		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ROM_q4		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ROM_q5		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL	Peso_0		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Peso_1		:	STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL	Peso_2		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Peso_3		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Peso_4		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Peso_5		:	STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL	Peso_6		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Peso_7		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL	REG_IN		:	STD_LOGIC_VECTOR(18 DOWNTO 0);
	SIGNAL	REG_OUT		:	STD_LOGIC_VECTOR(18 DOWNTO 0);
	
	SIGNAL	OUT_reLU		:	STD_LOGIC_VECTOR(18 downto 0);
	
	
BEGIN 
		--Contadores 
	
		CountFin: ENTITY work.Count_Fin 
		PORT MAP (	clk 					=> clk,
						CtrCount_Fin		=> Ctr_Count_Fin,
						RESET					=> rst_Count_Fin,
						S7						=> S_Count_Fin,
						FLAG_Fin				=> Flag_Count_Fin); --17
		
		CountRelu: ENTITY work.Count_Relu
		PORT MAP (	clk 					=> clk,
						Ctr_Count_Relu		=> Ctr_Count_Relu,
						RESET_CRelu			=> rst_Count_Relu,
						S6						=> S_Count_Relu,
						FLAG_CRelu			=> Flag_Count_Relu); --6 
		
		CountFiltro: ENTITY work.Count_Filtro
		PORT MAP (	clk 					=> clk,
						Ctr_CountFilt		=> Ctr_Count_Filtro,
						RESET					=> rst_Count_Filtro,
						S2						=> S_Count_Filtro,
						FLAG_Count_Filt	=> Flag_Count_Filtro); --3
		
		--Sumador para direcciones RAM
		Sum: ENTITY work.Sum
		PORT MAP (	dataa					 	=> S_count_Relu_aux,
						datab						=> S_Count_Fin,
						result					=> address_Ram_AUX
		);
		
		Compare: ENTITY work.Compare
		PORT MAP (	dataa					=> address_Ram_AUX,
						aeb					=> Flag_count_RAM
		);
		
		--Sumador para direcciones ROM 7
		Sum_7: ENTITY work.Sum_7
		PORT MAP (	dataa					 	=> S_count_Relu_aux,
						result					=> address_Rom_7
		);
		
		--Sumador para direcciones ROM 14
		Sum_14: ENTITY work.Sum_14
		PORT MAP (	dataa					 	=> S_count_Relu_aux,
						result					=> address_Rom_14
		);
		
		--Multiplexor
		Mux: ENTITY work.multiplexorFiltro
		PORT MAP (	sel0  				=> S_Count_Filtro(1),
						sel1  				=> S_Count_Filtro(0),
						x0						=> S_count_Relu_aux,
						x1						=> address_Rom_7,
						x2						=> address_Rom_14,
						y						=> address_Rom
		);
		
		
		--Memorias con pesos
		ROM_1: ENTITY work.ROM_Filtro_1
		PORT MAP (	address 		=> address_Rom,
						clock 		=> clk,
						rden 			=> rden, 
						q				=> ROM_q1);
		
		ROM_2: ENTITY work.ROM_Filtro_2
		PORT MAP (	address 		=> address_Rom,
						clock 		=> clk,
						rden 			=> rden, 
						q				=> ROM_q2);
						
		ROM_3: ENTITY work.ROM_Filtro_3
		PORT MAP (	address 		=> address_Rom,
						clock 		=> clk,
						rden 			=> rden, 
						q				=> ROM_q3);
						
		ROM_4: ENTITY work.ROM_Filtro_4
		PORT MAP (	address 		=> address_Rom,
						clock 		=> clk,
						rden 			=> rden, 
						q				=> ROM_q4);
						
		ROM_5: ENTITY work.ROM_Filtro_5
		PORT MAP (	address 		=> address_Rom,
						clock 		=> clk,
						rden 			=> rden, 
						q				=> ROM_q5);
		
		--Registros ROM
		Reg_ROM1: ENTITY work.Registro_ROM_1in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst1,
						Ena_1 			=> enab_reg_ROM_1,
						Registro_IN_1	=> ROM_q1,
						Registro_OUT	=> peso_0);
						
		Reg_ROM2: ENTITY work.Registro_ROM_2in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst2,
						Ena_1 			=> enab_reg_ROM_1,
						Ena_2 			=> enab_reg_ROM_2,
						Registro_IN_1	=> ROM_q1,
						Registro_IN_2	=> ROM_q2,
						Registro_OUT	=> peso_1);
		
		Reg_ROM3: ENTITY work.Registro_ROM_3in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst3,
						Ena_1 			=> enab_reg_ROM_1,
						Ena_2 			=> enab_reg_ROM_2,
						Ena_3 			=> enab_reg_ROM_3,
						Registro_IN_1	=> ROM_q1,
						Registro_IN_2	=> ROM_q2,
						Registro_IN_3	=> ROM_q3,
						Registro_OUT	=> peso_2);
		
		Reg_ROM4: ENTITY work.Registro_ROM_4in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst4,
						Ena_1 			=> enab_reg_ROM_1,
						Ena_2 			=> enab_reg_ROM_2,
						Ena_3 			=> enab_reg_ROM_3,
						Ena_4				=> enab_reg_ROM_4,
						Registro_IN_1	=> ROM_q1,
						Registro_IN_2	=> ROM_q2,
						Registro_IN_3	=> ROM_q3,
						Registro_IN_4	=> ROM_q4,
						Registro_OUT	=> peso_3);
						
		Reg_ROM5: ENTITY work.Registro_ROM_5in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst5,
						Ena_1 			=> enab_reg_ROM_1,
						Ena_2 			=> enab_reg_ROM_2,
						Ena_3 			=> enab_reg_ROM_3,
						Ena_4				=> enab_reg_ROM_4,
						Ena_5				=> enab_reg_ROM_5,
						Registro_IN_2	=> ROM_q2,
						Registro_IN_3	=> ROM_q3,
						Registro_IN_4	=> ROM_q4,
						Registro_IN_5	=> ROM_q5,
						Registro_OUT	=> peso_4);
						
		Reg_ROM6: ENTITY work.Registro_ROM_6in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst6,
						Ena_2 			=> enab_reg_ROM_2,
						Ena_3 			=> enab_reg_ROM_3,
						Ena_4 			=> enab_reg_ROM_4,
						Ena_5				=> enab_reg_ROM_5,
						Ena_6				=> enab_reg_ROM_6,
						Registro_IN_3	=> ROM_q3,
						Registro_IN_4	=> ROM_q4,
						Registro_IN_5	=> ROM_q5,
						Registro_OUT	=> peso_5);
						
		Reg_ROM7: ENTITY work.Registro_ROM_7in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst7,
						Ena_3 			=> enab_reg_ROM_3,
						Ena_4 			=> enab_reg_ROM_4,
						Ena_5 			=> enab_reg_ROM_5,
						Ena_6				=> enab_reg_ROM_6,
						Ena_7				=> enab_reg_ROM_7,
						Registro_IN_4	=> ROM_q4,
						Registro_IN_5	=> ROM_q5,
						Registro_OUT	=> peso_6);
		
		Reg_ROM8: ENTITY work.Registro_ROM_1in
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_raro_rst8,
						Ena_1 			=> enab_reg_ROM_8, 
						Registro_IN_1	=> ROM_q5,
						Registro_OUT	=> peso_7);

		--Registros de entrada
		Reg_in_0: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_1,
						Ena 				=> reg_in_ena_1,
						Registro_IN		=> Abd,
						Registro_OUT	=> Dato_0);
						
		Reg_in_1: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_2,
						Ena 				=> reg_in_ena_2,
						Registro_IN		=> Ronc,
						Registro_OUT	=> Dato_1);
		
		Reg_in_2: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_3,
						Ena 				=> reg_in_ena_3,
						Registro_IN		=> SPO_2,
						Registro_OUT	=> Dato_2);
						
		Reg_in_3: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_4,
						Ena 				=> reg_in_ena_4,
						Registro_IN		=> C4_A1,
						Registro_OUT	=> Dato_3);
						
		Reg_in_4: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_5,
						Ena 				=> reg_in_ena_5,
						Registro_IN		=> O2_A1,
						Registro_OUT	=> Dato_4);
						
		Reg_in_5: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_6,
						Ena 				=> reg_in_ena_6,
						Registro_IN		=> PPG,
						Registro_OUT	=> Dato_5);
						
		Reg_in_6: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_7,
						Ena 				=> reg_in_ena_7, 
						Registro_IN		=> FLA,
						Registro_OUT	=> Dato_6);
						
		Reg_in_7: ENTITY work.Registro8
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_in_rst_8,
						Ena 				=> reg_in_ena_8, 
						Registro_IN		=> torac,
						Registro_OUT	=> Dato_7);
		
		--Multiplicaciones y sumas
		Mult_0: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_0,
						datab			=> Peso_0,
						result		=> res_Mul_0);
					
		Mult_1: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_1,
						datab			=> Peso_1,
						result		=> res_Mul_1);
		
		Mult_2: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_2,
						datab			=> Peso_2,
						result		=> res_Mul_2);
		Mult_3: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_3,
						datab			=> Peso_3,
						result		=> res_Mul_3);
		
		Mult_4: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_4,
						datab			=> Peso_4,
						result		=> res_Mul_4);
		
		Mult_5: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_5,
						datab			=> Peso_5,
						result		=> res_Mul_5);
		
		Mult_6: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_6,
						datab			=> Peso_6,
						result		=> res_Mul_6);
		
		Mult_7: ENTITY work.Mult
		PORT MAP (	dataa			=> Dato_7,
						datab			=> Peso_7,
						result		=> res_Mul_7);
				
		Sum_ADD: ENTITY work.Sum_ADD
		PORT MAP (	data0x				 		=> res_Mul_0_aux,
						data1x				 		=> res_Mul_1_aux,
						data2x				 		=> res_Mul_2_aux,
						data3x						=> res_Mul_3_aux,
						data4x				 		=> res_Mul_4_aux,
						data5x				 		=> res_Mul_5_aux,
						data6x				 		=> res_Mul_6_aux,
						data7x						=> res_Mul_7_aux,
						data8x 						=> REG_OUT,
						result						=> REG_IN);
		
		Reg_Filtro: ENTITY work.Registro
		PORT MAP (	clk 				=> clk,
						n_Res 			=> reg_Filt_ena,
						Ena 				=> reg_Filt_rst, 
						Registro_IN		=> REG_IN,
						Registro_OUT	=> REG_OUT);
						
		--Funci??n de activaci??n
		reLU: ENTITY work.RELU
		PORT MAP (	clk 			=> clk,
						rst 			=> reLU_rst,
						ena 			=> reLU_ena,
						d 				=> REG_OUT,    
						q 				=> Filt_OUT);
		--Control 
		Control_Filtro: ENTITY work.control_conv
		PORT MAP (	clk 							=> clk,
						rst 							=> rst_Control,
						n_Control_Conv				=> n_Control_Conv,
						
						Flag_count_RAM			  =>  Flag_count_RAM, --Flags contadores
						Flag_count_Relu		  =>  Flag_count_Relu,
						Flag_count_Filtro		  =>  Flag_count_Filtro,
						--Flag_countROM_Filtro	  =>  Flag_countROM_Filtro,
						Flag_count_Fin			  =>  Flag_count_Fin,
							
						ena_RAM_1				  =>  ena_RAM_1, --Enables registros entrada
						ena_RAM_2				  =>  ena_RAM_2,
						ena_RAM_3				  =>  ena_RAM_3,
						ena_RAM_4				  =>  ena_RAM_4,
						ena_RAM_5				  =>  ena_RAM_5,
						ena_RAM_6				  =>  ena_RAM_6,
						ena_RAM_7				  =>  ena_RAM_7,
						ena_RAM_8				  =>  ena_RAM_8,
						
						rden					 	  =>  rden, --Enables ROMS
						
						enab_reg_ROM_1			  =>  enab_reg_ROM_1, --Enables registros ROM
						enab_reg_ROM_2			  =>  enab_reg_ROM_2,	
						enab_reg_ROM_3			  =>  enab_reg_ROM_3,
						enab_reg_ROM_4			  =>  enab_reg_ROM_4,
						enab_reg_ROM_5			  =>  enab_reg_ROM_5,
						enab_reg_ROM_6			  =>  enab_reg_ROM_6,	
						enab_reg_ROM_7			  =>  enab_reg_ROM_7,
						enab_reg_ROM_8			  =>  enab_reg_ROM_8,
						
						reg_raro_rst1			  =>  reg_raro_rst1, --Resets Registros ROM
						reg_raro_rst2			  =>  reg_raro_rst2,
						reg_raro_rst3			  =>  reg_raro_rst3,
						reg_raro_rst4			  =>  reg_raro_rst4,
						reg_raro_rst5			  =>  reg_raro_rst5,
						reg_raro_rst6			  =>  reg_raro_rst6,
						reg_raro_rst7			  =>  reg_raro_rst7,
						reg_raro_rst8			  =>  reg_raro_rst8,
						
						reg_in_ena_1			  =>  reg_in_ena_1, --Enables registros entrada
						reg_in_ena_2			  =>  reg_in_ena_2,
						reg_in_ena_3			  =>  reg_in_ena_3,
						reg_in_ena_4			  =>  reg_in_ena_4,
						reg_in_ena_5			  =>  reg_in_ena_5,
						reg_in_ena_6			  =>  reg_in_ena_6,
						reg_in_ena_7			  =>  reg_in_ena_7,
						reg_in_ena_8			  =>  reg_in_ena_8,
						
						reg_in_rst_1			  =>  reg_in_rst_1, --Resets registros entrada
						reg_in_rst_2			  =>  reg_in_rst_2,
						reg_in_rst_3			  =>  reg_in_rst_3,
						reg_in_rst_4			  =>  reg_in_rst_4,
						reg_in_rst_5			  =>  reg_in_rst_5,
						reg_in_rst_6			  =>  reg_in_rst_6,
						reg_in_rst_7			  =>  reg_in_rst_7,
						reg_in_rst_8			  =>  reg_in_rst_8,
						
						reLU_ena					  =>  reLU_ena, --RELU (Enable maxpooling)
						reLU_rst					  =>  reLU_rst,
						
						reg_Filt_ena			  =>  reg_Filt_ena, --Registro realimentado
						reg_Filt_rst			  =>  reg_Filt_rst,
						
						ctr_count_RAM			  =>  ctr_count_RAM, --Enables contadores
						ctr_count_Relu			  =>  Ctr_Count_Relu,
						ctr_count_Filtro		  =>  ctr_count_Filtro,
						ctr_countROM_Filtro	  =>  ctr_countROM_Filtro,
						ctr_count_Fin			  =>  ctr_count_Fin,
						
						Load_count			  =>	Load_count,
						
						rst_count_RAM			  =>  rst_count_RAM, --Resets contadores
						rst_count_Relu			  =>  rst_count_Relu,
						rst_count_Filtro		  =>  rst_count_Filtro,
						rst_countROM_Filtro	  =>  rst_countROM_Filtro,
						rst_count_Fin			  =>  rst_count_Fin,
						
						n_Max_Pooling			  =>	n_Max_Pooling,
						n_8byt					  =>  n_8byt
		);

address_Ram <= address_Ram_AUX;
--n_8byt		<=	reLU_ena;
		
AUX <= '0';
S_count_Relu_aux <= (AUX & AUX & S_count_Relu);
res_Mul_0_aux <= (AUX & AUX & AUX & res_Mul_0);
res_Mul_1_aux <= (AUX & AUX & AUX & res_Mul_1);
res_Mul_2_aux <= (AUX & AUX & AUX & res_Mul_2);
res_Mul_3_aux <= (AUX & AUX & AUX & res_Mul_3);
res_Mul_4_aux <= (AUX & AUX & AUX & res_Mul_4);
res_Mul_5_aux <= (AUX & AUX & AUX & res_Mul_5);
res_Mul_6_aux <= (AUX & AUX & AUX & res_Mul_6);
res_Mul_7_aux <= (AUX & AUX & AUX & res_Mul_7);

	
		
END ARCHITECTURE	functional;