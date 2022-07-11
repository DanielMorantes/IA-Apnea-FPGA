-- Pipos 1y2 con 5y6 van a Reg1
-- Pipos 3y4 con 7y8 van a Reg0	 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY RegistrosRAM IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				Reset					:		IN		STD_LOGIC;
				n8byt					:		IN 	STD_LOGIC;		--LLega de control enviado previamente por bloque contar_8_bits 	--
				Filt_Out				:		IN		STD_LOGIC_VECTOR (18 DOWNTO 0);
				rdaddressPar		:		IN		STD_LOGIC_VECTOR (4 DOWNTO 0);
				rdaddressImpar		:		IN		STD_LOGIC_VECTOR (4 DOWNTO 0);
				rden					:		IN		STD_LOGIC;
				--CtrDir				: 		IN		STD_LOGIC;
				--ResetDirMP			:		IN		STD_LOGIC;
				--wren					:		IN		STD_LOGIC;
				
				---------------			RAM para entrada a Primera Capa Oculta			---------------
				F_dirMPtoC1			:		OUT	STD_LOGIC;
				qRAMPares			: 		OUT 	STD_LOGIC_VECTOR (18 DOWNTO 0);
				qRAMImpares			:		OUT	STD_LOGIC_VECTOR (18 DOWNTO 0));
END ENTITY;

ARCHITECTURE	functional OF RegistrosRAM IS

SIGNAL Pipo_1_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_2_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_3_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_4_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_5_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_6_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_7_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_8_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);

SIGNAL Pipo_1_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_2_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_3_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_4_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_5_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_6_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_7_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Pipo_8_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);

SIGNAL dataa					: 		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL datab					: 		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL agb						: 		STD_LOGIC; 

SIGNAL PIPO1y2_OUT			: 		STD_LOGIC;
SIGNAL PIPO5y6_OUT			: 		STD_LOGIC;
SIGNAL PIPO3y4_OUT			: 		STD_LOGIC;
SIGNAL PIPO7y8_OUT			: 		STD_LOGIC;
SIGNAL COMPDCOMP_OUT			:		STD_LOGIC;
SIGNAL COMPDCOMP2_OUT		:		STD_LOGIC;

SIGNAL Reg_A_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Reg_A_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Reg_B_IN				:		STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL Reg_B_OUT				:		STD_LOGIC_VECTOR(18 DOWNTO 0);

SIGNAL data0x					: 		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL data1x					: 		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL sel						: 		STD_LOGIC;
SIGNAL result					:		STD_LOGIC_VECTOR (18 DOWNTO 0);

SIGNAL Mux1y2_OUT				:		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL Mux3y4_OUT				:		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL Mux5y6_OUT				:		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL Mux7y8_OUT				:		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL MuxComp_OUT			:		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL MuxComp2_OUT			:		STD_LOGIC_VECTOR (18 DOWNTO 0);

SIGNAL clock					: 		STD_LOGIC  := '1';
SIGNAL data						: 		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL rdaddress				:     STD_LOGIC_VECTOR (4 DOWNTO 0);
--SIGNAL rden						: 		STD_LOGIC  := '1';
SIGNAL wraddress				:		STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL wren						: 		STD_LOGIC  := '0';
--SIGNAL qRAMPares				: 		STD_LOGIC_VECTOR (18 DOWNTO 0);
--SIGNAL qRAMImpares			:		STD_LOGIC_VECTOR (18 DOWNTO 0);
SIGNAL q							:		STD_LOGIC_VECTOR (18 DOWNTO 0);

--SIGNAL CtrDir					: 		STD_LOGIC  := '1';
SIGNAL ResetDir			:		STD_LOGIC  := '1';
SIGNAL F_DirMP					:		STD_LOGIC  := '1';

SIGNAL 	n_count8vcs			:		STD_LOGIC;
SIGNAL	count8vcs		 	:		STD_LOGIC;
--SIGNAL	F_DirMPMP				:		STD_LOGIC;
SIGNAL	n_RegTempMP			:		STD_LOGIC;
SIGNAL	wrenMP				:		STD_LOGIC;
SIGNAL	n_dirMP				:		STD_LOGIC;
SIGNAL	ResetDirMP			:		STD_LOGIC;
SIGNAL 	SMP               : 		std_logic_vector(3 downto 0);
	
BEGIN
		
Memoria_Fifo2: ENTITY work.Pipo_2
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_2_IN	=> Pipo_2_IN,
				
						Pipo_1_IN	=> Pipo_1_IN);	

Memoria_Fifo1: ENTITY work.Pipo_1
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_1_IN	=> Pipo_1_IN,
				
						Pipo_1_OUT	=> Pipo_1_OUT);		
		
Comparador_Fifos_1y2: ENTITY work.Comparador_Pipo_1y2
		PORT MAP (	dataa			=>	Pipo_1_OUT,
						datab			=>	Pipo_1_IN,
						agb			=>	PIPO1y2_OUT);
						
Memoria_Fifo6: ENTITY work.Pipo_6
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_6_IN	=> Pipo_6_IN,
				
						Pipo_5_IN	=> Pipo_5_IN);	

Memoria_Fifo5: ENTITY work.Pipo_5
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_5_IN	=> Pipo_5_IN,
				
						Pipo_4_IN	=> Pipo_4_IN);
						
Comparador_Fifos_5y6: ENTITY work.Comparador_Pipo_5y6
		PORT MAP (	dataa			=>	Pipo_4_IN,
						datab			=>	Pipo_5_IN,
						agb			=>	PIPO5y6_OUT);		
		
ComparadorDeComparadores: ENTITY work.ComparadorDeComparadores
		PORT MAP (	dataa			=>	Mux1y2_OUT,
						datab			=>	Mux5y6_OUT,
						agb			=>	COMPDCOMP_OUT);	

Memoria_Fifo4: ENTITY work.Pipo_4
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_4_IN	=> Pipo_4_IN,
				
						Pipo_3_IN	=> Pipo_3_IN);	

Memoria_Fifo3: ENTITY work.Pipo_3
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_3_IN	=> Pipo_3_IN,
				
						Pipo_2_IN	=> Pipo_2_IN);		
		
Comparador_Fifos_3y4: ENTITY work.Comparador_Pipo_3y4
		PORT MAP (	dataa			=>	Pipo_2_IN,
						datab			=>	Pipo_3_IN,
						agb			=>	PIPO3y4_OUT);

Memoria_Fifo8: ENTITY work.Pipo_8
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_8_IN	=> Filt_Out,
				
						Pipo_7_IN	=> Pipo_7_IN);	

Memoria_Fifo7: ENTITY work.Pipo_7
		PORT MAP( 	clk			=> clk,
						Reset			=> Reset,
						n8byt			=> n8byt,
						Pipo_7_IN	=> Pipo_7_IN,
				
						Pipo_6_IN	=> Pipo_6_IN);
			
Comparador_Fifos_7y8: ENTITY work.Comparador_Pipo_7y8
		PORT MAP (	dataa			=>	Pipo_6_IN,
						datab			=>	Pipo_7_IN,
						agb			=>	PIPO7y8_OUT);			
						
Comparador_de_comparadores2: ENTITY work.Comparador_de_comparadores2
		PORT MAP (	dataa			=>	Mux3y4_OUT,
						datab			=>	Mux7y8_OUT,
						agb			=>	COMPDCOMP2_OUT);		
						
Mux_1y2: ENTITY work.Mux_1y2
		PORT MAP (	data0x			=>	Pipo_1_OUT,
						data1x			=>	Pipo_1_IN,
						sel				=>	PIPO1y2_OUT,
						result			=>	Mux1y2_OUT);
						
Mux_5y6: ENTITY work.Mux_5y6
		PORT MAP (	data0x			=>	Pipo_4_IN,
						data1x			=>	Pipo_5_IN,
						sel				=>	PIPO5y6_OUT,
						result			=>	Mux5y6_OUT);
						
Mux_3y4: ENTITY work.Mux_3y4
		PORT MAP (	data0x			=>	Pipo_2_IN,
						data1x			=>	Pipo_3_IN,
						sel				=>	PIPO3y4_OUT,
						result			=>	Mux3y4_OUT);
						
Mux_7y8: ENTITY work.Mux_7y8
		PORT MAP (	data0x			=>	Pipo_6_IN,
						data1x			=>	Pipo_7_IN,
						sel				=>	PIPO7y8_OUT,
						result			=>	Mux7y8_OUT);
						
Mux_Comparadores1: ENTITY work.Mux_Comparadores
		PORT MAP (	data0x			=>	Mux1y2_OUT,
						data1x			=>	Mux5y6_OUT,
						sel				=>	COMPDCOMP_OUT,
						result			=>	MuxComp_OUT);

Mux_Comparadores2: ENTITY work.Mux_Comparadores
		PORT MAP (	data0x			=>	Mux3y4_OUT,
						data1x			=>	Mux7y8_OUT,
						sel				=>	COMPDCOMP2_OUT,
						result			=>	MuxComp2_OUT);

RegTemp: ENTITY work.Reg_0
		PORT MAP (	clk			=>	clk,
						Reset			=>	Reset,
						n8byt			=>	n_RegTempMP,
						Reg_A_IN		=>	MuxComp_OUT,
						Reg_B_IN		=> MuxComp2_OUT,
						Reg_A_OUT	=>	Reg_A_OUT,
						Reg_B_OUT	=>	Reg_B_OUT);
						
RAMPares: ENTITY work.RAM1
		PORT MAP (	clock				=> clk,
						data				=> Reg_A_OUT,
						rdaddress	   => rdaddressPar,
						rden			 	=> rden,
						wraddress		=> wraddress,
						wren				=>	wrenMP,
						q					=> qRAMPares);
						
RAMImpares: ENTITY work.RAM2
		PORT MAP (	clock				=> clk,
						data				=> Reg_B_OUT,
						rdaddress	   => rdaddressImpar,
						rden			 	=> rden,
						wraddress		=>	wraddress,
						wren				=>	wrenMP,
						q					=> qRAMImpares);

DireccionesParEImpar: ENTITY work.DireccionesParEImpar
		PORT MAP (	clk	    	=> clk,
						CtrDir		=> n_dirMP,
						Reset_Dir		=> ResetDirMP,
						F_Dir 	     => F_DirMP,
						wraddress   => wraddress);	

CONTROL_MAX_POOLING: ENTITY work.ControlMP
		PORT MAP ( 	clk				=> clk,
						rst				=> Reset,
						n8byt				=> n8byt,
						count8vcs		=> count8vcs,
						F_DirMP			=> F_DirMP,
														
						n_count8vcs		=> n_count8vcs,
						n_RegTempMP		=> n_RegTempMP,
						wrenMP			=> wrenMP,
						n_dirMP			=> n_dirMP,
						ResetDirMP		=> ResetDirMP);	

ContadorDe8Veces: ENTITY work.Count_8vcs
		PORT MAP (	clk    			=> clk,
						n8byt				=> n_count8vcs,
						RESET				=> RESET,
						
						SMP            => SMP,
						count8vcs		=> count8vcs);
		
F_dirMPtoC1 <= F_dirMP;
		
END ARCHITECTURE	functional;
