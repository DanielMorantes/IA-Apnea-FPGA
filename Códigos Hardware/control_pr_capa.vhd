LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY control_pr_capa IS
	PORT( 	clk					:		IN		STD_LOGIC;
				rst					:		IN		STD_LOGIC;
				n_ContCapa1			:		IN		STD_LOGIC;
				n_ReLU				:		IN		STD_LOGIC;
				F_dir					:		IN		STD_LOGIC;
				GapTiempos			:		IN 	STD_LOGIC;
				DirRAM				:		IN 	STD_LOGIC;
				DirROM				:		IN		STD_LOGIC;
				
				ctr8count			:		OUT	STD_LOGIC;
				ResetRegTemp		:		OUT 	STD_LOGIC;
				n_ReLUCapa1			:		OUT	STD_LOGIC;
				n_memorias			:		OUT	STD_LOGIC;
				n_RegMemorias		:		OUT	STD_LOGIC;
				n_RegTemp			:		OUT	STD_LOGIC;
				RESET_DIR			:		OUT	STD_LOGIC;
				rden					:		OUT	STD_LOGIC;
				Ctr_CountGap  		:		OUT	STD_LOGIC;
				ResetRegRAM 		:		OUT	STD_LOGIC;
				nContCapa2			:		OUT	STD_LOGIC;
				wren2 				:		OUT	STD_LOGIC;
				nDir2					:		OUT	STD_LOGIC
				
				);												
END ENTITY;
--------------------------------------+02
ARCHITECTURE behavioral OF control_pr_capa	IS

	TYPE estados IS (CERO,UNO,DOS,TRES,CUATRO,CINCO,ESPERA1,ESPERA2,ESPERA3,ESPERA4,SEIS,SIETE,OCHO,NUEVE,DIEZ);
	SIGNAL state: estados; 
	
BEGIN


	PROCESS (rst,clk,GapTiempos, DirRAM, F_dir, DirROM)
	BEGIN
			IF(rst='0') THEN
					state <= CERO;
			ELSIF(rising_edge(clk)) THEN
				IF ((rst= '1')) THEN
						CASE state IS
								WHEN	CERO =>
										ctr8count		<= '0';
										n_ReLUCapa1		<= '0';
										n_memorias		<= '0';
										n_RegMemorias	<= '0';
										n_RegTemp		<= '0';
										RESET_DIR		<= '0';
										rden				<= '0';
										Ctr_CountGap  	<= '0';
										ResetRegRAM 	<= '0';
										ResetRegTemp	<= '0';
										nContCapa2		<= '0';
										wren2 			<= '0';
										nDir2				<= '0';
										state <= UNO;
									    										 
							   WHEN	UNO =>
										ctr8count		<= '0';
										n_ReLUCapa1		<= '0';
										n_memorias		<= '0';
										n_RegMemorias	<= '0';
										n_RegTemp		<= '0';
										RESET_DIR		<= '0';
										rden				<= '0';
										Ctr_CountGap  	<= '0';
										ResetRegRAM 	<= '0';
										ResetRegTemp	<= '0';
										nContCapa2		<= '0';	
										wren2 			<= '0';
										nDir2				<= '0';
										IF (F_dir = '1') THEN		  
										 	state <= DOS;
										ELSE 
											state <= UNO;
										END IF;
										 
								WHEN	DOS =>
										IF (F_dir = '0') THEN		  
										 	ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '1';
											RESET_DIR		<= '1';
											rden				<= '1';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= TRES;
										ELSE 
											ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= DOS;
										END IF;
										 
								WHEN  TRES =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '0';
										 n_RegMemorias	<= '1';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '1';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0';
										 nContCapa2		<= '0';
										 wren2 			<= '0';
										 nDir2			<= '0';
										 state <= CUATRO;
										 
								WHEN	CUATRO =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '1';
										 n_RegMemorias	<= '0';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '0';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0'; 
										 nContCapa2		<= '0'; 
										 wren2 			<= '0';
										 nDir2				<= '0';
										 state <= CINCO;
										 
								WHEN	CINCO =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '0';
										 n_RegMemorias	<= '0';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '0';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0';
										 nContCapa2		<= '0';
										 wren2 			<= '0';
										 nDir2			<= '0';
										 state <= ESPERA1;
										 
								WHEN	ESPERA1 =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '0';
										 n_RegMemorias	<= '0';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '0';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0';
										 nContCapa2		<= '0';
										 wren2 			<= '0';
										 nDir2			<= '0';
										 state <= ESPERA2;
										 
								WHEN	ESPERA2 =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '0';
										 n_RegMemorias	<= '0';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '0';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0';
										 nContCapa2		<= '0';
										 wren2 			<= '0';
										 nDir2			<= '0';
										 state <= ESPERA3;
										 
								WHEN	ESPERA3 =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '0';
										 n_RegMemorias	<= '0';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '0';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0';
										 nContCapa2		<= '0';
										 wren2 			<= '0';
										 nDir2			<= '0';
										 state <= ESPERA4;
										 
								WHEN	ESPERA4 =>
										 ctr8count		<= '0';
										 n_ReLUCapa1	<= '0';
										 n_memorias		<= '0';
										 n_RegMemorias	<= '0';
										 n_RegTemp		<= '0';
										 RESET_DIR		<= '0';
										 rden				<= '0';
										 Ctr_CountGap  <= '0';
										 ResetRegRAM 	<= '0';
										 ResetRegTemp	<= '0';
										 nContCapa2		<= '0';
										 wren2 			<= '0';
										 nDir2			<= '0';
										 state <= SEIS;
										 
								WHEN  SEIS =>
										ctr8count		<= '0';
										n_ReLUCapa1		<= '0';
										n_memorias		<= '0';
										n_RegMemorias	<= '0';
										n_RegTemp		<= '0';
										RESET_DIR		<= '0';
										rden				<= '0';
										Ctr_CountGap  	<= '0';
										ResetRegRAM 	<= '0';
										ResetRegTemp	<= '0';	
										nContCapa2		<= '0';
										wren2 			<= '0';
										nDir2				<= '0';
										state <= SIETE;
										
								WHEN	SIETE =>
										IF (DirRAM = '0') THEN		  -- Direcci??n RAM
										 	ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= DOS;
										ELSE 
											ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '1';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '1';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= OCHO;
										END IF;
										 
								WHEN	OCHO =>
										 IF (DirRAM = '1') THEN		  -- Direcci??n RAM
										 	ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= NUEVE;
										ELSE 
											ctr8count		<= '0';
											n_ReLUCapa1		<= '1';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= OCHO;
										END IF;
								WHEN  NUEVE =>
										 IF (DirROM = '1') THEN		  -- Direcci??n RAM
										 	ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '1';
											nContCapa2		<= '1';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= DIEZ;
										ELSE 
											ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '1';
											nContCapa2		<= '0';
											wren2 			<= '1';
											nDir2				<= '1';
											state <= DOS;
										END IF;		
								WHEN	DIEZ =>
										   ctr8count		<= '0';
											n_ReLUCapa1		<= '0';
											n_memorias		<= '0';
											n_RegMemorias	<= '0';
											n_RegTemp		<= '0';
											RESET_DIR		<= '0';
											rden				<= '0';
											Ctr_CountGap   <= '0';
											ResetRegRAM 	<= '0';
											ResetRegTemp	<= '0';
											nContCapa2		<= '0';
											wren2 			<= '0';
											nDir2				<= '0';
											state <= UNO;
										 
							END CASE;
					END IF;
			END IF;
	END PROCESS;
	
	
END ARCHITECTURE;