LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY control_se_capa IS
	PORT( 	clk					:		IN		STD_LOGIC;
				rst					:		IN		STD_LOGIC;
				n_ContCapa2			:		IN		STD_LOGIC;
				--n_ReLU				:		IN		STD_LOGIC;
				F_dir_Capa2			:		IN		STD_LOGIC;
								
				rden2					:		OUT	STD_LOGIC;
				n_RegTemp2			:		OUT 	STD_LOGIC;
				n_memorias2			:		OUT	STD_LOGIC;
				n_softmax			:		OUT	STD_LOGIC;
				RESET_dir2			:		OUT	STD_LOGIC;
				ResetRegTempCapa2 :		OUT	STD_LOGIC
				
				);												
END ENTITY;
--------------------------------------+02
ARCHITECTURE behavioral OF control_se_capa	IS

	TYPE estados IS (CERO,UNO,ESPERA1,ESPERA2,DOS,TRES,CUATRO,CINCO,SEIS);
	SIGNAL state: estados; 
	
BEGIN


	PROCESS (rst,clk,n_contCapa2,F_dir_Capa2)
	BEGIN
			IF(rst='0') THEN
					state <= CERO;
			ELSIF(rising_edge(clk)) THEN
				IF ((rst= '1')) THEN
						CASE state IS
								WHEN	CERO =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										RESET_dir2			<=	'0';
										ResetRegTempCapa2 <= '0';
										IF (n_contCapa2 = '1') THEN
											state <= UNO;
										ELSE 
											state <= CERO;
										END IF;
									    										 
							   WHEN	UNO =>
										rden2					<= '1';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										RESET_dir2			<=	'0';
										ResetRegTempCapa2 <= '0';
										state <= ESPERA1;
										 
								WHEN	ESPERA1 =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										RESET_dir2			<=	'0';
										ResetRegTempCapa2 <= '0';
										state <= ESPERA2;
										 
								WHEN	ESPERA2 =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										ResetRegTempCapa2 <= '0';
										state <= DOS;
								
								WHEN	DOS =>
										rden2					<= '0';
										n_RegTemp2			<= '1';
										n_memorias2			<= '1';
										n_softmax			<= '0';
										ResetRegTempCapa2 <= '0';
										state <= TRES;
										 
								WHEN  TRES =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										ResetRegTempCapa2 <= '0';
										IF (F_dir_Capa2 = '1') THEN
											state <= CUATRO;
										ELSE 
											state <= UNO;
										END IF;
										 
								WHEN	CUATRO =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '1';
										RESET_dir2			<=	'1';
										ResetRegTempCapa2 <= '0';
										state <= CINCO;
										 
								WHEN	CINCO =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										RESET_dir2			<=	'0';
										ResetRegTempCapa2 <= '1';
										state <= SEIS;
										 
								WHEN	SEIS =>
										rden2					<= '0';
										n_RegTemp2			<= '0';
										n_memorias2			<= '0';
										n_softmax			<= '0';
										RESET_dir2			<=	'0';
										ResetRegTempCapa2 <= '0';
										state <= CERO;
										 										 
							END CASE;
					END IF;
			END IF;
	END PROCESS;
	
	
END ARCHITECTURE;