library ieee;

use ieee.std_logic_1164.all;

entity display1Digito is
	port( numA, Numb : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (6 downto 0);
			overflow : out std_logic
	);
end display1Digito;

architecture arch_display1 of display1Digito is 
	
	signal tempS : std_logic_vector (3 downto 0);
	
	component parallel_adder is
			port( numA, numB : in std_logic_vector (3 downto 0);
					soma: out std_logic_vector (3 downto 0);
					carry_out : out std_logic	
			);

	end component;
		
	component BCD_to_seg7 is
			port( entrada : in std_logic_vector (3 downto 0);
					saida : out std_logic_vector (6 downto 0)
			);
	end component;
	
begin

	somador: parallel_adder
	port map (numA => numA, numB => numB, soma => tempS, carry_out => overflow);
	
	bcdto7: BCD_to_seg7
	port map (entrada => tempS, saida => saida);

end arch_display1;