library ieee;
use ieee.std_logic_1164.all;

entity parallel_adder is

	port(  numA, numB : in std_logic_vector (3 downto 0);
		soma: out std_logic_vector (3 downto 0);
		carry_out : out std_logic
		
	);

end parallel_adder;

architecture arch_parallel of parallel_adder is

signal tempCarry : std_logic_vector (2 downto 0);

	component half_adder
		port(  a, b : in std_logic;
			sum, carry : out std_logic
		);
	end component;

	component full_adder is
		port(  x, y, c_in : in std_logic;
			s, c_out : out std_logic
		);

	end component;

begin

	Half: half_adder
				port map(a => numA(0), b => numB(0), sum => soma(0), carry => tempCarry(0));
	
	full_2: full_adder
				port map(x => numA(1), y => numB(1), c_in => tempCarry(1), s => soma(1), c_out => tempCarry(1));
	
	full_1: full_adder
				port map(x => numA(2), y => numB(2), c_in => tempCarry(2), s => soma(2), c_out => tempCarry(2));
					
	full_0: full_adder
				port map(x => numA(3), y => numB(3), c_in => tempCarry(3), s => soma(3), c_out => carry_out);
				

end arch_parallel;

