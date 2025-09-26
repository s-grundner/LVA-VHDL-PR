--------------------------------------------------------------------------------
-- file: delta_adc_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: Delta ADC module definition
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- ENTITY

entity delta_adc is
	generic (
		BITWIDTH : natural := 8;
		SAMPLING_PSC : natural := 4
	);
	port (
		clk_i				: in std_ulogic;
		rst_i				: in std_ulogic;
		PWM_o 				: out std_logic;
		ADC_valid_strobe_o 	: out std_ulogic;
		ADC_Value_o 		: out unsigned(BITWIDTH-1 downto 0);
		Comparator_i 		: in std_logic
	);
end delta_adc;

