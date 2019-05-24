library ieee;

use ieee.std_logic_1164.all;

entity ULA is
	port (numA, numB : in std_logic_vector (3 downto 0);
			control_Div_Mult : in std_logic;
			controlAB : in std_logic;
			selectMenu : in std_logic_vector (2 downto 0);
			zero : out std_logic;
			overflow : out std_logic;
			out0, out1 : out std_logic_vector (6 downto 0)
			);
	end ULA;
	
architecture bhv_ULA of ULA is
	
	signal tempSS, tempMult, tempDiv, tempAND, tempNOT, tempSOMA, tempOR, tempXOR : std_logic_vector (3 downto 0);
	signal tempIN : std_logic_vector (3 downto 0);
	signal overSomaSub, overM, overD, overSoma : std_logic;
	signal tempAB : std_logic_vector (3 downto 0);
	signal tempSaida0C2, tempSaida1c2, tempSaida0, tempSaida1 : std_logic_vector (6 downto 0) ;
	
	component somadorSubtratror is
		port(  numA, numB : in std_logic_vector (3 downto 0);
			controle : in std_logic; 
			soma: out std_logic_vector (3 downto 0);
			overflow : out std_logic		
		);
	end component;
	
	component coversorC2 is
		port( num : in std_logic_vector (3 downto 0);
			saida0, saida1 : out std_logic_vector (6 downto 0)
		);
	end component;
	
	component coversorB is
		port( num : in std_logic_vector (3 downto 0);
			saida0, saida1 : out std_logic_vector (6 downto 0)
		);
	end component;
	
	component divide2or4 is
		port(	num : in std_logic_vector (3 downto 0);
				control : in std_logic;
				output1 : out std_logic_vector (3 downto 0);
				overflow : out std_logic
		);
	end component;

	component mult2or4 is
		port(	num : in std_logic_vector (3 downto 0);
				control : in std_logic;
				output0 : out std_logic_vector (3 downto 0);
				overflow : out std_logic
		);
	end component;
	
	
	component parallel_adder is
		port( numA, numB : in std_logic_vector (3 downto 0);
				soma: out std_logic_vector (3 downto 0);
				carry_out : out std_logic		
			);
		end component;
	
	begin 
	
		with controlAB select tempAB <=
			numA when '0',
			numB when '1';
		
		somaSub : somadorSubtratror port map (numA => numA, numB => numB, controle => control_Div_Mult, soma => tempSS, overflow => overSomaSub);
		
		divide : divide2or4 port map (num => tempAB, control => control_Div_Mult, output1 => tempDiv, overflow => overD);
		
		multipl : mult2or4 port map (num => tempAB, control => control_Div_Mult, output0 => tempMult, overflow => overM);
		
		somaBin : parallel_adder port map (numA => numA, numB => numB, soma => tempSOMA, carry_out => overSoma);
		
		tempAND <= numA and numB;
		
		tempNOT <= not tempAB;
		
		tempOR <= numA or numB;
		
		tempXOR <= numA xor numB;
		
		converB : coversorB port map (num => tempIN, saida0=> tempSaida0C2, saida1 => tempSaida1c2);
		
		converC2 : coversorC2 port map (num => tempIN, saida0=> tempSaida0, saida1 => tempSaida1);
		
		zero <= tempIN(3) and tempIN (2) and tempIN(1) and tempiN(0);
		
		with selectMenu select overflow <=
			overSomaSub when "000",
			overSoma 	when "001",
			overM			when "010",
			overD			when "011",
			'0'  			when others;
		
		with selectMenu select tempIN <=
			tempSS 	when "000",
			tempSOMA when "001",
			tempMult when "010",
			tempDiv 	when "011",
			tempAND 	when "100",
			tempNOT 	when "101",
			tempOR  	when "110",
			tempXOR 	when "111";
			
		with selectMenu select out0 <=
			tempSaida0C2 when "000",
			tempSaida0 	 when others;
		
		with selectMenu select out1 <=
			tempsaida1c2 when "000",
			tempsaida1 	 when others;
		
		end bhv_ULA;

	
	
	
	
	
	