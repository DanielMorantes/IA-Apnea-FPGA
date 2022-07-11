-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/09/2019 05:06:32"
                                                            
-- Vhdl Test Bench template for design  :  UART
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CNNCompleta_tb IS
END CNNCompleta_tb;
ARCHITECTURE CNNCompleta_tb_arch OF CNNCompleta_tb IS
-- constants  
constant PERIODO : time:=20 ns;    -- Período del reloj                                               
-- signals                                                   
SIGNAL clk_tb			 		:	STD_LOGIC := '0';
SIGNAL RESET_tb			 	: 	STD_LOGIC := '1';
SIGNAL Bit_entrada_tb 		:	STD_LOGIC := '1';
SIGNAL Reset_out_ext_tb			:	STD_LOGIC;
SIGNAL Reloj_out_tb				:	STD_LOGIC;
SIGNAL nsoftmax_tb				:	STD_LOGIC;
SIGNAL Apnea_OUT_tb				:	STD_LOGIC;

BEGIN

process
begin
   clk_tb <= '1';
   wait for PERIODO/2;
   clk_tb <= '0';
   wait for PERIODO/2;
end process;

	DUT: ENTITY work.CNNCompleta
	PORT MAP (
-- list connections between master ports and signals
	clk => clk_tb,
	RESET => RESET_tb,
	Bit_entrada => Bit_entrada_tb,
	
	nsoftmax	=> nsoftmax_tb,
	Apnea_OUT		=> Apnea_OUT_tb,
	Reset_out_ext	=> Reset_out_ext_tb,
	Reloj_out		=> Reloj_out_tb);
	
testVectorGenerator : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
--Inicio
RESET_tb <= '0';
Bit_entrada_tb <= '1';   
               
WAIT FOR 500 ns;      
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;

--Espera por el bit de inicio ------------ SEGUNDOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ TERCEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ CUARTOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ QUINTOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ SEXTOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ SEPTIMOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ OCTAVOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;
--
----Lectura del primer byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00000";                      
--WAIT FOR 250 us;
----Lectura del segundo byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00001";                      
--WAIT FOR 250 us;
----Lectura del tercer byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00010"; 
--WAIT FOR 250 us; 
----Lectura del cuarto byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00011"; 
--WAIT FOR 250 us; 
----Lectura del quinto byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00100"; 
--WAIT FOR 250 us; 
----Lectura del sexto byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00101"; 
--WAIT FOR 250 us; 
----Lectura del septimo byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00110"; 
--WAIT FOR 250 us; 
----Lectura del octavo byte
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '1';
--rdaddress_tb <= "00111"; 
--WAIT FOR 250 us; 

                                             
--Inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
               
WAIT FOR 500 ns;      
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;

--Espera por el bit de inicio ------------ SEGUNDOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ TERCEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ CUARTOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ QUINTOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ SEXTOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '10001110' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ SEPTIMOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
----Espera entre bytes
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 100 us;

--Espera por el bit de inicio ------------ OCTAVOS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '11101011' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11011101' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '10100001' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '01111110' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10000001' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '10111101' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '11010111' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';  
                           
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      

--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
--El siguiente byte es '11110001' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1'; 

--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;

--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;

--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;

--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;

--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;
--Espera por el bit de inicio ------------ PRIMEROS 8 BYTES
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
--Próximo byte es '10101010' - C_abdom
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo   
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo   
                     
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
--El siguiente byte es '11001100' - F_aire
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11100011' - PPG
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo     
                
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';      
                  
WAIT FOR 104 us;
--El siguiente byte es '10110011' - C_Toracico
RESET_tb <= '1';
Bit_entrada_tb <= '1';   --Bit menos significativo    
                 
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo    
                    
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '01001100' - I_ronquido
RESET_tb <= '1';
Bit_entrada_tb <= '0';   --Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';   
                     
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';       
                 
WAIT FOR 104 us;
--El siguiente byte es '11111111' - SPO2
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo     
                   
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';         
               
WAIT FOR 104 us;
--El siguiente byte es '01010101' - C4_A1
RESET_tb <= '1';
Bit_entrada_tb <= '1';   	--Bit menos significativo      
               
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
--El siguiente byte es '11110000' - 02_A1
RESET_tb <= '1';
Bit_entrada_tb <= '0';   	--Bit menos significativo       
              
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '0';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';    
                    
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';      
                  
WAIT FOR 104 us;
RESET_tb <= '1';
Bit_entrada_tb <= '1';  	-- Bit más significativo      
                  
WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';        
                
WAIT FOR 500 us;
--Espera por el bit de inicio
RESET_tb <= '1';
Bit_entrada_tb <= '1';         
               
WAIT FOR 104 us;
----El siguiente byte es '00001111' - Byte de transicion
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';   	--Bit menos significativo     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                   
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '1';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';     
--rden_tb <= '0';
--rdaddress_tb <= "00000";                      
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';       
--rden_tb <= '0';
--rdaddress_tb <= "00000";                    
--WAIT FOR 104 us;
--RESET_tb <= '1';
--Bit_entrada_tb <= '0';  	-- Bit más significativo      
--rden_tb <= '0';
--rdaddress_tb <= "00000";                     
--WAIT FOR 104 us;
--Espera entre bytes
RESET_tb <= '1';
Bit_entrada_tb <= '1';     
                   
WAIT FOR 100 us;


									
END PROCESS testVectorGenerator;                                           
                                        
END CNNCompleta_tb_arch;