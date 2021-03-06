library ieee;

use ieee.std_logic_1164.all;

entity display2Digito is
	port( numA, Numb : in std_logic_vector (3 downto 0);
			saida1 : out std_logic_vector (6 downto 0);
			saida2 : out std_logic_vector (6 downto 0);
			overflow : out std_logic
	);
end display2Digito;

architecture arch_display2 of display2Digito is 
	
	signal tempS : std_logic_vector (3 downto 0);
	signal tempBCD : std_logic_vector (7 downto 0); 
	
	component parallel_adder is
			port( numA, numB : in std_logic_vector (3 downto 0);
					soma: out std_logic_vector (3 downto 0);
					carry_out : out std_logic	
			);
	end component;
		
	component ConversorBCD is
			port( entrada : in std_logic_vector (3 downto 0);
					saida : out std_logic_vector (7 downto 0)
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
	
	conversor: ConversorBCD
	port map (entrada => tempS, saida => tempBCD);
	
	bcdto7_0: BCD_to_seg7
	port map (entrada => tempBCD(7 downto 4), saida => saida1);
	
	bcdto7_1: BCD_to_seg7
	port map (entrada => tempBCD(3 downto 0), saida => saida2);

end arch_display2;