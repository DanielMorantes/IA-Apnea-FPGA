LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------
--DEFINICION DEl ENTITY = ENTRADAS Y SALIDAS
--*********************--
ENTITY relu IS
			PORT( clk : IN  STD_LOGIC;
					rst : IN  STD_LOGIC;
					ena : IN  STD_LOGIC;
					d 	 : IN  STD_LOGIC_VECTOR (18 DOWNTO 0);
					q   : OUT STD_LOGIC_VECTOR (18 DOWNTO 0)
			);
END ENTITY;

ARCHITECTURE caseArch OF relu IS
	SIGNAL data  : INTEGER;
	SIGNAL q_aux : UNSIGNED (18 DOWNTO 0);
BEGIN
	data  <= to_integer(signed(d));

	PROCESS (clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q_aux <= "0000000000000000000";
			ELSIF (rising_edge(clk)) THEN
				IF (ena	=	'1') THEN
					IF (data > 0) THEN
						q_aux <= to_unsigned(data, q_aux'length);
					ELSE
						q_aux <= "0000000000000000000";
					END IF;
				END IF;
	END IF;

	END PROCESS;
	q <= std_logic_vector(q_aux);
	
END ARCHITECTURE;