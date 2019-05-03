library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_e3 is
	
	port(	entrada: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(3 downto 0)
	);
	
end bcd_to_e3;

architecture behv of bcd_to_e3 is
begin
		process(entrada)
		begin
			case entrada is
				when "0000" => saida <= "0011";
				when "0001" => saida <= "0100";
				when "0010" => saida <= "0101";
				when "0011" => saida <= "0110";
				when "0100" => saida <= "0111";
				when "0101" => saida <= "1000";
				when "0110" => saida <= "1001";
				when "0111" => saida <= "1010";
				when "1000" => saida <= "1011";
				when "1001" => saida <= "1100";
				when "1010" => saida <= "0001";
				when "1011" => saida <= "0001";
				when "1100" => saida <= "0001";
				when "1101" => saida <= "0001";
				when "1110" => saida <= "0001";
				when "1111" => saida <= "0001";
				when others => saida <= "0000";
			end case;
		end process;
	end behv;
	


	
