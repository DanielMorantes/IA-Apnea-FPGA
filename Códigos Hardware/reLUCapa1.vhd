LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------
--DEFINICION DEl ENTITY = ENTRADAS Y SALIDAS
--*********************--
ENTITY reLUCapa1 IS
			PORT( clk : IN  STD_LOGIC;
					rst : IN  STD_LOGIC;
					ena : IN  STD_LOGIC;
					d 	 : IN  STD_LOGIC_VECTOR (34 DOWNTO 0);
					q   : OUT STD_LOGIC_VECTOR (34 DOWNTO 0)
			);
END ENTITY;

ARCHITECTURE caseArch OF reLUCapa1 IS
	SIGNAL data  : INTEGER;
	SIGNAL q_aux : UNSIGNED (34 DOWNTO 0);
BEGIN
	data  <= to_integer(signed(d));

	PROCESS (clk,rst,ena)
		BEGIN
			IF (rst = '1') THEN
				q_aux <= "00000000000000000000000000000000000";
			ELSIF (rising_edge(clk)) THEN
				IF (ena	=	'1') THEN
					IF (data > 0) THEN
						q_aux <= to_unsigned(data, q_aux'length);
					ELSE
						q_aux <= "00000000000000000000000000000000000";
					END IF;
				END IF;
	END IF;

	END PROCESS;
	q <= std_logic_vector(q_aux);
	
END ARCHITECTURE;