library ieee;
use ieee.std_logic_1164.all;

entity coversorB is
	port( num : in std_logic_vector (3 downto 0);
			saida0, saida1 : out std_logic_vector (6 downto 0)
	);
end coversorB;

architecture bhv_coversorB of coversorB is

	signal tempB8 : std_logic_vector (7 downto 0);
	
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
	
		bcd : ConversorBCD port map(entrada => num, saida => tempB8);
		
		seg7_1 : BCD_to_seg7 port map(entrada => tempB8(7 downto 4), saida => saida1);
		
		seg7_0 : BCD_to_seg7 port map(entrada => tempB8(3 downto 0), saida => saida0);
	
	end bhv_coversorB;
		
		
	
		
	