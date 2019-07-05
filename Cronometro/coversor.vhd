library ieee;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

entity coversor is
	port( 	entrada : in std_logic_vector (5 downto 0);
		saida0, saida1 : out std_logic_vector (6 downto 0)
	);
end coversor;

architecture bhv_coversorB of coversor is

	signal temp1, temp2 : std_logic_vector (5 downto 0);

	component BCD_to_seg7 is
		port( 	entrada : in std_logic_vector (5 downto 0);
			saida : out std_logic_vector (6 downto 0)
		);
	end component;
	
begin
		process(entrada)
		variable num : std_logic_vector (5 downto 0);
		begin
			num := entrada;
			if num < 10 then
				temp1 <= num;
				temp2 <= "000000";
				elsif num > 9 and num < 20 then
					temp1 <= num - 10;
					temp2 <= "000001";
					elsif num > 19 and num < 30 then
						temp1 <= num - 20;
						temp2 <= "000010";
						elsif num > 29 and num < 40 then
							temp1 <= num - 30; 
							temp2 <= "000011";
							elsif num > 39 and num < 50 then
								temp1 <= num -40;
								temp2 <= "000100";
								elsif num > 49 and num < 60 then
									temp1 <= num - 50;
									temp2 <= "000101";
				end if;
		
		end process;
			
		seg7_1 : BCD_to_seg7 port map (entrada => temp2, saida => saida1);
		
		seg7_0 : BCD_to_seg7 port map (entrada => temp1, saida => saida0);

	
end bhv_coversorB;
		
		
	
		
	
