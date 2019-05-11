library ieee;

use ieee.std_logic_1164.all;

entity ConversorBCD is
	port( entrada : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (7 downto 0)
	);
end ConversorBCD;

architecture arch_ConversorBCD of ConversorBCD is
	begin
		with entrada select saida <=
		
		 "11111111" when "0000",
       "01111111" when "0001",
       "10111111" when "0010",
       "00111111" when "0011",
       "11011111" when "0100",
       "01011111" when "0101",
       "10011111" when "0110",
       "00011111" when "0111",
       "11101111" when "1000",
       "01101111" when "1001",
		 "11110111" when "1010",
		 "01110111" when "1011",
		 "01111011" when "1100",
		 "01110011" when "1101",
		 "01111101" when "1110",
		 "01110101" when "1111";
	
	end arch_ConversorBCD;
		 
		
		
		