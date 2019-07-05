LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE ieee.numeric_std.all;

entity clockDivide is
	port( clk, ctrl, clear: in std_logic;
			clkOut: out std_logic
			);
end clockDivide;

architecture bhv of clockDivide is
	signal clkD : integer;
	signal count : integer := 1;
	signal outp : std_logic := '0';
begin
	
	with ctrl select clkD <=
		5000000 when '0',
		100000000 when '1';
	
	process(clk, clear)
	begin	
		if clear = '1' then
			outp <= '0';
			count <= 1;
			elsif rising_edge(clk) then
				count <= count + 1;
				if count = clkD then
					outp <= not outp;
					count <= 1;
				end if;
		end if;

	clkOut <= outp;
end process;
				
end bhv;