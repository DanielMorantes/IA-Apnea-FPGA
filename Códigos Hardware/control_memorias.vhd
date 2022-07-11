LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY control_memorias IS
	PORT( 	clk					:		IN		STD_LOGIC;		--Reloj del sistema de 50 MHz
				RESET					:		IN		STD_LOGIC;
				F_Count3				:		IN		STD_LOGIC;		--Bit entrada UART
				F_Count4				:		IN		STD_LOGIC;
				CtrDir				:		OUT	STD_LOGIC;
				RESET_dir			:		OUT	STD_LOGIC;
				CtrCount4			:		OUT	STD_LOGIC;
				Control_NN			:		OUT	STD_LOGIC;
				wren					:		OUT	STD_LOGIC
				);												
END ENTITY;
--------------------------------------
ARCHITECTURE behavioral OF control_memorias	IS

	TYPE estados IS (CERO,UNO,DOS,TRES);
	SIGNAL state: estados;
SIGNAL count3 : std_LOGIC;
			
BEGIN


	PROCESS (RESET,clk,F_Count3, F_Count4)
	BEGIN
			IF(RESET='0') THEN
					state <= CERO;
			ELSIF(rising_edge(clk)) THEN
				IF (RESET= '1') THEN
						CASE state IS
							WHEN	CERO =>
								IF (F_Count3 = '1') THEN
									wren <= '0';
									CtrDir <= '0';
									CtrCount4 <= '0';
									count3 <= '1';
									RESET_dir <= '1';
									Control_NN <= '0';
									state <= UNO;
								ELSE
									state <= CERO;	   
								END IF;
										 
							WHEN	UNO =>
								IF (F_Count3 = '0') THEN	
									wren <= '1';
									CtrDir <= '1';
									CtrCount4 <= '1';
									count3 <= '0';
									RESET_dir <= '1';
									Control_NN <= '0';
									state <= DOS;
								ELSE
									state <= UNO;
								END IF;
								
							WHEN  DOS =>
								IF (F_Count4 = '1') THEN
									wren <= '0';
									CtrDir <= '0';
									CtrCount4 <= '0';	 
									count3 <= '0';
									RESET_dir <= '0';
									Control_NN <= '1';
									state <= CERO;
								ELSE
									wren <= '0';
									CtrDir <= '0';
									CtrCount4 <= '0';	
									count3 <= '0';	
									RESET_dir <= '1';
									Control_NN <= '0';
									state <= TRES;
								END IF;
										 
							WHEN	TRES =>
								wren <= '0';
								CtrDir <= '0';
								CtrCount4 <= '0';
								count3 <= '0';
								RESET_dir <= '1';
								Control_NN <= '0';
								state <= CERO;
										 										 	 
							END CASE;
					END IF;
			END IF;
	END PROCESS;
	
	
END ARCHITECTURE;