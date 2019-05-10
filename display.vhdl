librairy ieee.

use ieee.std_logic.1694.all

entity display is
  port( entrada1, entrada2 : in std_logic_vector (3 downto 0);
        s : out std_logic_vector (3 downto 0);
        overflow : out std_logic
  );
  
  arquicheture arch_display of display is 
    signal t
