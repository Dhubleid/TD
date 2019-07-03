library ieee;
use ieee.std_logic_1164.all;

entity BCD_to_seg7 is
	port( entrada : in std_logic_vector (3 downto 0);
			saida : out std_logic_vector (6 downto 0)
	);
end BCD_to_seg7;

architecture arch_BCDto7 of BCD_to_seg7 is
		begin
			with entrada select saida <=
				
				"1000000" when "000000",
				"1111001" when "000001",
				"0100100" when "000010",
				"0110000" when "000011",
				"0011001" when "000100",
				"0010010" when "000101",
				"0000010" when "000110",
				"1111000" when "000111",
				"0000000" when "001000",
				"0010000" when "001001",       
				"1111111" when others;
				
		end arch_BCDto7;	
