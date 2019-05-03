library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port(  x, y, c_in : in std_logic;
		s, c_out : out std_logic
);

end full_adder;


architecture arch2 of full_adder is
signal tempS, tempC, tempC2 : std_logic;

component half_adder
	port(  a, b : in std_logic;
		sum, carry : out std_logic
	);
end component;

begin

	Half1: half_adder
				port map(a => x, b => y, sum => tempS, carry => tempC);
	Half2: half_adder
				port map(a => tempS, b => c_in, sum => s, carry => tempC2);
				
	c_out <= tempC or tempC2;

end arch2;
				
	

