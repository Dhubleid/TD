library ieee;
use ieee.std_logic_1164.all;

entity mux_4_to_1 is
port(	entrada: in std_logic_vector(3 downto 0);
		Sel: in std_logic_vector(1 downto 0);
		saida: out std_logic
);
end mux_4_to_1;

architecture bhv of mux_4_to_1 is
begin

with sel select saida<=
	entrada(0) when "00",
	entrada(1) when "01",
	entrada(2) when "10",
	entrada(3) when others;

end bhv;

