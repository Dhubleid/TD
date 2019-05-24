library ieee;

use ieee.std_logic_1164.all;

entity mult2or4 is
	port(	num : in std_logic_vector (3 downto 0);
			control : in std_logic;
			output0 : out std_logic_vector (3 downto 0);
			overflow : out std_logic
	);
end mult2or4;

architecture bhv of mult2or4 is
	begin

		output0(0) <= '0';
		output0(1) <= (not control and num(0)) or (control and '0');
		output0(2) <= (not control and num(1)) or (control and num(0));
		output0(3) <= (not control and num(2)) or (control and num(1));
	
		overflow <= num(3) or (num(2) and control);

	end bhv;
	
	

			
			