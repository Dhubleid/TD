library ieee;

use ieee.std_logic_1164.all;

entity display is
	port( entrada : in std_logic_vector (3 downto 0);
			saidac2 : out std_logic_vector (6 downto 0);
			saida0 : out std_logic_vector (6 downto 0);
			saida1 : out std_logic_vector (6 downto 0);
			sinal : out out std_logic_vector (6 downto 0)
	);
end display;


architecture estrut1 of display is

signal tempc2, temps0, temps1 : std_logic_vector (3 downto 0);
signal tempS: std_logic_vector (7 downto 0);


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
	
	BCDc2: ConversorBCDcomp2 port map(entrada => entrada, saida => tempc2);
	
	BCD: ConversorBCD port map( entrada => entrada, saida => tempS);
	
	c2seg7: BCD_to_seg7 port map(entrada => tempc2, saida => saidac2);
	
	seg7_0: BCD_to_seg7 port map(entrada => tempS(7 downto 4), saida => saida0);
	
	seg7_1: BCD_to_seg7 port map(entrada => tempS(3 downto 0), saida => saida1);

	
	end estrut1;
		 
		
		
		
