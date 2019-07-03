LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

entity cronometro is
	port(	Clock, Clear, Hold, ProgRegr, SecondsOrFast, Load: in std_logic;
			Start : in std_logic_vector (5 downto 0);
			Output1, Output2 : out std_logic_vector(6 downto 0);
	);
			
architecture arch_crono of cronometro is
signal enable : std_logic;

process
	variable count: std_logic;
	variable desiredClock : std_logic;
begin
	
	if secondsOrFast = '1' then
		desiredClock := ‭2625A0‬; --‭2500000‬ = 20Hz
		else
			desiredClock := ‭‭17D7840‬; -- 25000000 = 2Hz
				
	if Clock event' and Clock = '1' then
		enable <= '0';
		count := count + 1;
		if count = desiredClock / 2;
			enable <= '1';
			count := 0;
		end if;
	end if;
end process;
signal tempCount : std_logic_vector (5 downto 0);
process(Enable, Hold, Clear)
begin	
	variable count : std_logic_vector (5 downto 0);
	if Clear = '1' then
		Output1 = 0;
		Output2 = 0;
		Count := 0;
		elsif Load = '1' then 
			Count := Start;
			elsif Hold = '0' then
				if Enable = '1' then
					if progRegr = '0' then					
						count := count + 1;
						if count = 60 then
							count = 0;
						end if
					else
						if count > 0 then
							count := count - 1;
						end if;
					end if
				end if
			end if
		end if
	end if
	tempCount <= count;
end process
	
				
			
			
	

	
		
	
	
