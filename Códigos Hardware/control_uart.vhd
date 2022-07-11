LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY control_uart IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				RESET					:		IN		STD_LOGIC;
				Bit_entrada			:		IN		STD_LOGIC;		--Bit entrada UART
				FLAG1					:		IN		STD_LOGIC;
				FLAG2					:		IN		STD_LOGIC;		--LLega a control enviado previamente por bloque contar_medio_bit cuando termina el conteo de 52 us (2604 conteos)
				FLAG3					:		IN 	STD_LOGIC;		--LLega a control enviado previamente por bloque contar_8_bits 	--
				Ctr_Count1			:		OUT	STD_LOGIC;
				Ctr_Count2			:		OUT	STD_LOGIC;
				RESET_C1				: 		OUT 	STD_LOGIC;
				RESET_C2				:		OUT	STD_LOGIC;
				nRegCorr				:		OUT 	STD_LOGIC;
				nRegPar				:		OUT	STD_LOGIC;
				--Control_NN			:		OUT	STD_LOGIC;
				estado				:		OUT	STD_LOGIC_VECTOR(2 downto 0)
				);												
END ENTITY;
--------------------------------------
ARCHITECTURE behavioral OF control_uart	IS

	TYPE estados IS (CERO,UNO,DOS,DOSYMEDIO,TRES,CUATRO,CINCO,SEIS);
	SIGNAL state: estados;
	
		
BEGIN


	PROCESS (RESET,clk,Bit_entrada,FLAG1,FLAG2,FLAG3)
	BEGIN
			IF(RESET='1') THEN
					state <= CERO;
			ELSIF(rising_edge(clk)) THEN
				IF (RESET= '0') THEN
						CASE state IS
							WHEN	CERO =>
								estado <= "000";
								IF (Bit_entrada = '0') THEN
									Ctr_Count1 <= '1';
									Ctr_Count2 <= '0';
									RESET_C1 <= '1';
									RESET_C2 <= '1';
									nRegCorr <= '1';
									nRegPar 	<= '0';
									state <= UNO;
								ELSE
									state <= CERO;	   
								END IF;
										 
							WHEN	UNO =>
								estado <= "001";
								IF (FLAG1 = '1') THEN
									Ctr_Count1 <= '1';
									Ctr_Count2 <= '0';
									RESET_C1 <= '1';
									RESET_C2 <= '1';
									nRegCorr <= '1';
									nRegPar 	<= '0';
									state <= DOS;
								ELSE
									state <= UNO;
								END IF;
							
							WHEN DOS =>
								estado <= "010";
								Ctr_Count1 <= '1';
								Ctr_Count2 <= '0';
								RESET_C1 <= '0';
								RESET_C2 <= '1';
								nRegCorr <= '1';
								nRegPar 	<= '0';
								state <= DOSYMEDIO;
							
--							WHEN DOSYCUARTO =>
--								Ctr_Count1 <= '1';
--								Ctr_Count2 <= '0';
--								RESET_C1 <= '0';
--								state <= DOSYMEDIO;
--							
							WHEN DOSYMEDIO =>
								estado <= "011";
								Ctr_Count1 <= '1';
								Ctr_Count2 <= '0';
								RESET_C1 <= '1';
								RESET_C2 <= '1';
								nRegCorr <= '1';
								nRegPar 	<= '0';
								state <= TRES;
							WHEN  TRES =>
								estado <= "100";
								IF (FLAG2 = '1') THEN
									Ctr_Count1 <= '1';
									Ctr_Count2 <= '0';
									RESET_C1 <= '1';
									RESET_C2 <= '1';	
									nRegCorr <= '0';
									nRegPar 	<= '0';		
									state <= CUATRO;
								ELSE
									state <= TRES;
								END IF;
								
										 
							WHEN	CUATRO =>
								estado <= "101";
								Ctr_Count1 <= '1';
								Ctr_Count2 <= '0';
								RESET_C1 <= '1';
								RESET_C2 <= '1';
								nRegCorr <= '1';
								nRegPar 	<= '0';
								state <= CINCO;
										 										 
							WHEN  CINCO =>
								estado <= "110";
								IF (FLAG1 = '1' AND FLAG3 = '0') THEN
									Ctr_Count1 <= '0';
									Ctr_Count2 <= '1';
									RESET_C1 <= '0';
									RESET_C2 <= '1';	
									nRegCorr <= '1';
									nRegPar 	<= '0';
									state <= SEIS;
								ELSIF (FLAG1 = '1' AND FLAG3 = '1') THEN 					
									Ctr_Count1 <= '0';
									Ctr_Count2 <= '1';
									RESET_C1 <= '0';
									RESET_C2 <= '1';	
									nRegCorr <= '1';
									nRegPar 	<= '1';
									state <= SEIS;
								ELSE 
									state <= CINCO;
								END IF;
								
										 
							WHEN  SEIS =>
								estado <= "111";
								IF (FLAG3 = '1') THEN
									Ctr_Count1 <= '0';
									Ctr_Count2 <= '0';
									RESET_C1 <= '1';
									RESET_C2 <= '0';
									nRegCorr <= '0';
									nRegPar 	<= '0';
									state <= CERO;
								ELSE					
									Ctr_Count1 <= '0';
									Ctr_Count2 <= '0';
									RESET_C1 <= '1';
									RESET_C2 <= '1';
									nRegCorr <= '0';
									nRegPar 	<= '0';
									state <= CUATRO;
								END IF;
										 
							END CASE;
					END IF;
			END IF;			
	END PROCESS;
	
END ARCHITECTURE;  