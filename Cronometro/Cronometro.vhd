LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

entity cronometro is
	port(	Clock, Clear, Hold, ProgRegr, SecondsOrFast, Load : in std_logic;
			Start : in std_logic_vector (5 downto 0);
			Output1, Output2 : out std_logic_vector(6 downto 0)
	);
end cronometro;
			
architecture arch_crono of cronometro is
	signal enableC : std_logic;
	signal tempCount : std_logic_vector (5 downto 0);

	
	component coversor is
		port	( 	entrada : in std_logic_vector (5 downto 0);
					saida0, saida1 : out std_logic_vector (6 downto 0)
				);
	end component;
	
	component clockDivide is
		port	( 	clk, ctrl, clear: in std_logic;
					clkOut: out std_logic
				);
	end component;

begin 

 process(Hold, Clear, EnableC)
	variable count : std_logic_vector (5 downto 0) := "000000";
	begin	
		if Clear = '1' then
			tempCount <= "000000";
			Count := "000000";
			elsif Load = '1' then 
				Count := Start;
				if Count > 59 then
					Count := "111011";
				end if;
				elsif Hold = '0' then
					if rising_edge(enableC) then
							if progRegr = '0' then					
								count := count + 1;
									if count = 60 then
										count := "000000";
									end if;
								else 
									if count = 0 then
										count := "111011";
									end if;
									count := count - 1;
							end if;
					end if;
		end if;
		tempCount <= count;
	end process;
	
	covers : coversor port map (entrada => tempCount, saida0 => output1, saida1 => output2);
	
	divide : clockDivide Port Map( clk => clock, ctrl => secondsOrFast,clear => Clear, clkOut => enableC);

end arch_crono;
				
			
			
	

	
		
	
	
