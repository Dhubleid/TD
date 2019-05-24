library ieee;

use ieee.std_logic_1164.all;

entity ConversorBCDcomp2 is
	port( entrada : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (3 downto 0)
	);
end ConversorBCDcomp2;

architecture arch_Comp2 of ConversorBCDcomp2 is
	begin
		with entrada select saida <=
		
		 "0000" when "0000",
       "0001" when "0001",
       "0010" when "0010",
       "0011" when "0011",
       "0100" when "0100",
       "0101" when "0101",
       "0110" when "0110",
       "0111" when "0111",
       "1000" when "1000",
       "0111" when "1001",
		 "0110" when "1010",
		 "0101" when "1011",
		 "0100" when "1100",
		 "0011" when "1101",
		 "0010" when "1110",
		 "0001" when "1111";
	
	end arch_Comp2;
		 
		
		
		