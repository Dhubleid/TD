library ieee;
use ieee.std_logic_1164.all;

entity coversorB is
	port( 	entrada : in std_logic_vector (5 downto 0);
		saida0, saida1 : out std_logic_vector (6 downto 0)
	);
end coversorB;

architecture bhv_coversorB of coversorB is

	signal temp1, temp2 : std_logic_vector (5 downto 0);
	
	component ConversorBCD is
		port( 	entrada : in std_logic_vector (5 downto 0);
			saida : out std_logic_vector (7 downto 0)
		);
	end component;

	component BCD_to_seg7 is
		port( 	entrada : in std_logic_vector (5 downto 0);
			saida : out std_logic_vector (6 downto 0)
		);
	end component;
	
	begin
		process
		begin
			variable num : std_logic;
			num := entrada;
			if num < 9 then
				temp1 <= num;
				temp1 <= 0;
				elsif num > 9 and num < 20 then
					temp1 <= num - 10;
					temp2 <= 1;
					elsif num > 19 and num < 30 then
						temp1 <= num - 20;
						temp2 <= 2;
						elsif num > 29 and num < 40 then
							temp1 <= num - 30; 
							temp2 <= 3;
							elsif num > 39 and num < 50 then
								temp1 <= num -40;
								temp2 <= 4;
								elsif num > 49 and num < 60 then
									temp1 <= num - 50;
									temp2 <= 5;
								end if
							end if
						end if
					end if
				end if
			end if
		end process
		
		
		bcd1 : ConversorBCD port map(entrada => entrada, saida => temp1);
		
		bcd2 : ConversorBCD port map(entrada => entrada, saida => temp2);
		
		seg7_1 : BCD_to_seg7 port map(entrada => temp1, saida => saida1);
		
		seg7_0 : BCD_to_seg7 port map(entrada => temp2, saida => saida0);
	
	end bhv_coversorB;
		
		
	
		
	
