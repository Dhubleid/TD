library ieee;

use ieee.std_logic_1164.all;

entity coversorC2 is
	port( num : in std_logic_vector (3 downto 0);
			saida0, saida1 : out std_logic_vector (6 downto 0)
	);	
end coversorC2;


architecture bhv_coversorC2 of coversorC2 is

	signal tempC2 : std_logic_vector (3 downto 0);
	
	component ConversorBCDcomp2 is
		port( entrada : in std_logic_vector (3 downto 0);
				saida : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component BCD_to_seg7 is
		port( entrada : in std_logic_vector (3 downto 0);
				saida : out std_logic_vector (6 downto 0)
		);
	end component;
	
	begin
	
	bcdCmp : ConversorBCDcomp2 port map(entrada => num, saida => tempC2);
	
	bcdSeg : BCD_to_seg7 port map(entrada => tempC2, saida => saida0);
	
	with num(3) select saida1 <=
		"0000001" when '1',
		"0000000" when others;
	
	end bhv_coversorC2;
	

	

		
		
		