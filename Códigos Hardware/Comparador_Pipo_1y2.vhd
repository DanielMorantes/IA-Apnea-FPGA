-- megafunction wizard: %LPM_COMPARE%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_COMPARE 

-- ============================================================
-- File Name: Comparador_Pipo_1y2.vhd
-- Megafunction Name(s):
-- 			LPM_COMPARE
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 15.0.0 Build 145 04/22/2015 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, the Altera Quartus II License Agreement,
--the Altera MegaCore Function License Agreement, or other 
--applicable license agreement, including, without limitation, 
--that your use is for the sole purpose of programming logic 
--devices manufactured by Altera and sold by Altera or its 
--authorized distributors.  Please refer to the applicable 
--agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY Comparador_Pipo_1y2 IS
	PORT
	(
		dataa		: IN STD_LOGIC_VECTOR (18 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (18 DOWNTO 0);
		agb		: OUT STD_LOGIC 
	);
END Comparador_Pipo_1y2;


ARCHITECTURE SYN OF comparador_pipo_1y2 IS

	SIGNAL sub_wire0	: STD_LOGIC ;



	COMPONENT lpm_compare
	GENERIC (
		lpm_representation		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (18 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (18 DOWNTO 0);
			agb	: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	agb    <= sub_wire0;

	LPM_COMPARE_component : LPM_COMPARE
	GENERIC MAP (
		lpm_representation => "UNSIGNED",
		lpm_type => "LPM_COMPARE",
		lpm_width => 19
	)
	PORT MAP (
		dataa => dataa,
		datab => datab,
		agb => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: AeqB NUMERIC "0"
-- Retrieval info: PRIVATE: AgeB NUMERIC "0"
-- Retrieval info: PRIVATE: AgtB NUMERIC "1"
-- Retrieval info: PRIVATE: AleB NUMERIC "0"
-- Retrieval info: PRIVATE: AltB NUMERIC "0"
-- Retrieval info: PRIVATE: AneB NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
-- Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
-- Retrieval info: PRIVATE: Latency NUMERIC "0"
-- Retrieval info: PRIVATE: PortBValue NUMERIC "0"
-- Retrieval info: PRIVATE: Radix NUMERIC "10"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: SignedCompare NUMERIC "0"
-- Retrieval info: PRIVATE: aclr NUMERIC "0"
-- Retrieval info: PRIVATE: clken NUMERIC "0"
-- Retrieval info: PRIVATE: isPortBConstant NUMERIC "0"
-- Retrieval info: PRIVATE: nBit NUMERIC "19"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COMPARE"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "19"
-- Retrieval info: USED_PORT: agb 0 0 0 0 OUTPUT NODEFVAL "agb"
-- Retrieval info: USED_PORT: dataa 0 0 19 0 INPUT NODEFVAL "dataa[18..0]"
-- Retrieval info: USED_PORT: datab 0 0 19 0 INPUT NODEFVAL "datab[18..0]"
-- Retrieval info: CONNECT: @dataa 0 0 19 0 dataa 0 0 19 0
-- Retrieval info: CONNECT: @datab 0 0 19 0 datab 0 0 19 0
-- Retrieval info: CONNECT: agb 0 0 0 0 @agb 0 0 0 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL Comparador_Pipo_1y2.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Comparador_Pipo_1y2.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Comparador_Pipo_1y2.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Comparador_Pipo_1y2.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Comparador_Pipo_1y2_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
