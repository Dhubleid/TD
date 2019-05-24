library ieee;

use ieee.std_logic_1164.all;

entity display is
	port( entrada : in std_logic_vector (3 downto 0);
			saidac2 : out std_logic_vector (6 downto 0);
			saida0 : out std_logic_vector (6 downto 0);
			saida0 : out std_logic_vector (6 downto 0);
			sinal : out out std_logic_vector (6 downto 0)
	);
end display;


architecture estrut1 of display is
signal comp2

component ConversorBCDcomp2 is
	port( entrada : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (3 downto 0)
	);
end ConversorBCDcomp2;

component ConversorBCD is
	port( entrada : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (7 downto 0)
	);
end ConversorBCD;

entity BCD_to_seg7 is
	port( entrada : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (6 downto 0)
	);
end BCD_to_seg7;
	
	begin 

	with entrada(3) select sinal <=
		"0000001" when '1';
	BCDc2: ConversorBCDcomp2 port map(entrada => entrada, 

	
	end estrut1;
		 
		
		
		
