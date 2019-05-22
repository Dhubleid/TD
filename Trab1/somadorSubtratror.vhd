library ieee;
use ieee.std_logic_1164.all;

entity somadorSubtratror is

	port(  numA, numB : in std_logic_vector (3 downto 0);
		controle : in std_logic; 
		soma: out std_logic_vector (3 downto 0);
		overflow : out std_logic		
	);

end somadorSubtratror;

architecture arch_somaSub of somadorSubtratror is

signal tempCarry : std_logic_vector (3 downto 0);

	component full_adder is
		port(  x, y, c_in : in std_logic;
			s, c_out : out std_logic
		);

	end component;

begin

	full_0: full_adder
				port map(x => numA(0), y => (controle XOR numB(0)), c_in => controle, s => soma(0), c_out => tempCarry(0));
	
	full_1: full_adder
				port map(x => numA(1), y => (tempCarry(0) XOR numB(1)), c_in => tempCarry(0), s => soma(1), c_out => tempCarry(1));
	
	full_2: full_adder
				port map(x => numA(2), y => (tempCarry(1) XOR numB(2)), c_in => tempCarry(1), s => soma(2), c_out => tempCarry(2));
					
	full_3: full_adder
				port map(x => numA(3), y => (tempCarry(2) XOR numB(3)), c_in => tempCarry(2), s => soma(3), c_out => tempCarry(3));
	
	overflow <= tempCarry(2) XOR tempCarry(3);
				

end arch_somaSub;
				