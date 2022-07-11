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

ENTITY Reg_Desp_tb IS
END Reg_Desp_tb;
ARCHITECTURE RegistroDeCorrimientos_arch OF Reg_Desp_tb IS
-- constants  
constant PERIODO : time:=20 ns;    -- Período del clk                                               
-- signals                                                   
SIGNAL clk_tb			 	 :		STD_LOGIC := '0';
SIGNAL n_Res_tb		 	 : 	STD_LOGIC := '0';
SIGNAL nRegCorr_tb	 	 :		STD_LOGIC := '0';
SIGNAL Bit_entrada_tb 	 :		STD_LOGIC := '0';
SIGNAL Registro_8_IN_tb	 :		STD_LOGIC_VECTOR(7 downto 0);
SIGNAL clk_out_tb			 :		STD_LOGIC;
SIGNAL rst_out				 : 	STD_LOGIC;
--SIGNAL Registro_8_IN_tb			:		STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

process
begin
   clk_tb <= '1';
   wait for PERIODO/2;
   clk_tb <= '0';
   wait for PERIODO/2;
end process;

	DUT: ENTITY work.RegistroDeCorrimientos
	PORT MAP (
-- list connections between master ports and signals
	clk => clk_tb,
	n_Res => n_Res_tb,
	nRegCorr => nRegCorr_tb,
	Bit_entrada => Bit_entrada_tb,
	Registro_8_IN => Registro_8_IN_tb
	);
	
testVectorGenerator : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
--Inicio
nRegCorr_tb <= '0';
n_Res_tb <= '1';
Bit_entrada_tb <= '0';                   
WAIT FOR 500 ns;      
--Primer Bit - 0
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '0';                     
WAIT FOR 20 ns;  
--Segundo Bit - 0
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '0';                     
WAIT FOR 20 ns;  
--Tercer Bit - 1
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '1';                     
WAIT FOR 20 ns; 
--Cuarto Bit - 1
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '1';                     
WAIT FOR 20 ns;  
--Quinto Bit - 0
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '0';                     
WAIT FOR 20 ns;  
--Sexto Bit - 1
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '0';                     
WAIT FOR 20 ns;  
--Septimo Bit - 0
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '1';                     
WAIT FOR 20 ns; 
--Octavo Bit - 1
nRegCorr_tb <= '1';
n_Res_tb <= '1';
Bit_entrada_tb <= '1';                     
WAIT FOR 20 ns;  
--Finish
nRegCorr_tb <= '0';
n_Res_tb <= '0';
Bit_entrada_tb <= '0';                     
WAIT FOR 200 ns;  
                                                 
END PROCESS testVectorGenerator;                                           
                                        
END RegistroDeCorrimientos_arch;
