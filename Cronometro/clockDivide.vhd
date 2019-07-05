LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE ieee.numeric_std.all;

entity clockDivide is
	port( clk, ctrl, clear: in std_logic;
			clkOut: out std_logic
			);
end clockDivide;

architecture bhv of clockDivide is
begin
	process(clk)
		variable count: integer := 1 ;
		variable clckD:  integer;
		variable outp: std_logic;
	begin	
		if clear = '1' then
			outp := '0';
			count := 1;		
			elsif ctrl = '1' then
				clckD := 25000000;
				else 
					clckD :=  1250000;	
			if rising_edge(clk) then
				count := count + 1;
				if count = clckD then
					outp := not outp;
					count := 1;
				end if;
			end if;
		end if;
	clkOut <= outp;
end process;
				
end bhv;