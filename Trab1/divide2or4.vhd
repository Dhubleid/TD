library ieee;

use ieee.std_logic_1164.all;

entity divide2or4 is
	port(	num : in std_logic_vector (3 downto 0);
			control : in std_logic;
			output : out std_logic_vector (3 downto 0);
			overflow : out std_logic
	);
end divide2or4;

architecture bhvd of mult2or4 is
	begin

		output(3) <= '0';
		output(2) <= (not control and num(3)) or (control and '0');
		output(1) <= (not control and num(2)) or (control and num(3));
		output(0) <= (not control and num(1)) or (control and num(2));
	
		overflow <= num(0) or (num(1) and control);

	end bhvd;
	
	