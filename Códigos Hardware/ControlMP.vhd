LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY ControlMP IS
	PORT( 	clk					:		IN		STD_LOGIC;
				rst					:		IN		STD_LOGIC;
				n8byt				:		IN		STD_LOGIC;
				count8vcs		 	:		IN		STD_LOGIC;
				F_dirMP				:		IN		STD_LOGIC;
												
				n_count8vcs			:		OUT	STD_LOGIC;
				n_RegTempMP			:		OUT	STD_LOGIC;
				wrenMP				:		OUT 	STD_LOGIC;
				n_dirMP				:		OUT	STD_LOGIC;
				ResetDirMP			:		OUT	STD_LOGIC			
				
				);												
END ENTITY;
--------------------------------------
ARCHITECTURE behavioral OF ControlMP	IS

	TYPE estados IS (CERO,CEROYMEDIO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,SIETE);
	SIGNAL stateMP: estados; 
	
BEGIN


	PROCESS (rst,clk,n8byt, count8vcs )
	BEGIN
			IF(rst='0') THEN
					stateMP <= CERO;
			ELSIF(rising_edge(clk)) THEN
				IF ((rst= '1')) THEN
						CASE stateMP IS
								WHEN	CERO =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '0';
										wrenMP			<= '0';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										IF ((n8byt = '1')) THEN
											stateMP <= CEROYMEDIO;
										ELSE 
											stateMP <= CERO;
										END IF;
									
								WHEN	CEROYMEDIO =>
										n_count8vcs		<= '1';
										n_RegTempMP		<= '0';
										wrenMP			<= '0';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										stateMP <= UNO;
								
							   WHEN	UNO =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '0';
										wrenMP			<= '0';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										IF (Count8vcs = '1') THEN		  
										 	stateMP <= DOS;
										ELSE 
											stateMP <= CERO;
										END IF;
										 
								WHEN	DOS =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '0';
										wrenMP			<= '0';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										stateMP <= TRES;
											
								WHEN  TRES =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '1';
										wrenMP			<= '0';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										stateMP <= CUATRO;
										 
								WHEN	CUATRO =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '0';
										wrenMP			<= '1';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										stateMP <= CINCO;
										
								WHEN	CINCO =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '0';
										wrenMP			<= '0';
										n_dirMP			<= '1';
										ResetDirMP		<= '0';
										stateMP <= SEIS;
										 
								WHEN  SEIS =>
										IF (F_dirMP = '1') THEN		  
										 	n_count8vcs		<= '0';
											n_RegTempMP		<= '0';
											wrenMP			<= '0';
											n_dirMP			<= '0';
											ResetDirMP		<= '1';
											stateMP <= SIETE;
										ELSE
											n_count8vcs		<= '0';
											n_RegTempMP		<= '0';
											wrenMP			<= '0';
											n_dirMP			<= '0';
											ResetDirMP		<= '0';
											stateMP <= CERO;
										END IF;
										
								WHEN	SIETE =>
										n_count8vcs		<= '0';
										n_RegTempMP		<= '0';
										wrenMP			<= '0';
										n_dirMP			<= '0';
										ResetDirMP		<= '0';
										stateMP <= CERO;
										 
							END CASE;
					END IF;
			END IF;
	END PROCESS;
	
	
END ARCHITECTURE;