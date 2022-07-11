library IEEE;
use IEEE.std_logic_1164.all;

entity MultiplexorFiltro is
    port (
        y : out std_logic_vector (4 downto 0);
        sel1, sel0 :	in std_logic;
		  x2, x1, x0 : in std_logic_vector (4 downto 0)
    );
end entity;

architecture arch of MultiplexorFiltro is
    signal auxSelVect : std_logic_vector (1 downto 0);

begin

    auxSelVect(1) <= sel1;
    auxSelVect(0) <= sel0;

    y <= x0 when auxSelVect = "00" else
		   x1 when auxSelVect = "01" else
		   x2 when auxSelVect = "10" else
		   --x3 when auxSelVect = "11" else
         "UUUUU";

end architecture;