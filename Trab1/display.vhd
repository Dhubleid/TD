library ieee;

use iee.std_logic_1164.all;

entity estrutura is 

port ( numA, numB : in std_logic_vector (3 downto 0);
		 Mult_div: in std_logic;
		 saida1, saida0 : out std_logic_vector (3 downto 0);
		 overflow, zero : out std_logic
		);
end estrutura;

architecture bhv_estrutura of estrutura is 
	signal 
