use ieee;

librairy iee.std_logic.1164.all;

entity half_adder is
  port(
        a,b : in bit;
        sum, carry : out bit
        );
end half_adder;

architecture arch_half_adder of half_adder is 
  begin 
    sum <= a xor b;
    carry <= a and b;
 end arch_half_adder;
  

