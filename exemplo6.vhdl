//https://www.cs.sfu.ca/~ggbaker/reference/std_logic/1164/std_logic.html
//https://vhdlwhiz.com/std_logic_vector/

LIBRAIRY IEEE
USE ieee_std_logic_1164
  
entity is exemplo 
  port( S : out std_logic
  end exemplo; 
        
arquiteture exem of exemplo6 is
       
  signal vetor: std_logic_vector(2 downto 0);

  begin    
 
      S <: vetor(1) and vetor(2) or vetor (0);
  end exem;
      
