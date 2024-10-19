library ieee;
use ieee.std_logic_1164.all;

entity adder is
	generic (
		BITWIDTH : natural := 4
	);
	port (	
		operand_a_i : in std_ulogic_vector(BITWIDTH-1 downto 0);
		operand_b_i : in std_ulogic_vector(BITWIDTH-1 downto 0);
		result_o : out std_ulogic_vector(BITWIDTH downto 0) 
	);
end entity adder;