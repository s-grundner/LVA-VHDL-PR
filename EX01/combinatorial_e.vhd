--------------------------------------------------------------------------------
-- file: combinatorialg_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: 
--------------------------------------------------------------------------------

entity combinatorial is
	port (
		operand_a_i, operand_b_i : in bit;
	    and_o, or_o : out bit
	);
end entity combinatorial;