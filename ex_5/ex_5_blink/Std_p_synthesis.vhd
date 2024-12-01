library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;

package std_definitions is
  type blink_fsm_state_type is (START, WAIT_2s, LED_ON );      
  constant CLK_FREQUENCY : natural := 50000000;
  --synthesis translate_off
	constant BLINK_CNT_MAX_VAL : natural := 5;
	--synthesis translate_on
  
	--synthesis read_comments_as_HDL on
  --constant BLINK_CNT_MAX_VAL : natural := CLK_FREQUENCY;
  --synthesis read_comments_as_HDL off
  constant BLINK_CNT_BITWIDTH : natural := natural(ceil(log2(real(BLINK_CNT_MAX_VAL))));
end package std_definitions;
