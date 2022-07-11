LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY muxes Is
Port( x1 	: IN STD_LOGIC;
		x2 	: IN STD_LOGIC;
		x3 	: IN STD_LOGIC;
		x4 	: IN STD_LOGIC;
		sel 	: IN STD_LOGIC;
		sel2	: IN STD_LOGIC;
		y1  	: OUT STD_LOGIC);
		
END ENTITY muxes;
ARCHITECTURE gatelevel OF muxes IS
signal p0 : STD_LOGIC;
signal p1 : STD_LOGIC;
BEGIN 
	mux_gates: ENTITY WORK.mux2_1_gates
	PORT MAP (	x1 	=> x1,
					x2 	=> x2,
					sel	=> sel,
					y		=> p0);
	mux_withselect: ENTITY work.mux2_1_gates
	PORT MAP (	x1 	=> x3,
					x2 	=> x4,
					sel	=> sel,
					y		=> p1);
					
	mux_when_else: ENTITY work.mux2_1_gates
	PORT MAP (	x1 	=> p0,
					x2 	=> p1,
					sel	=> sel2,
					y		=> y1);
END ARCHITECTURE gatelevel;