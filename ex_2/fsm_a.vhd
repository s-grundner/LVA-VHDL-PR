library IEEE;
use IEEE.std_logic_1164.all;

-- enum

package std_definitions is
    type fsm_state_type is (START, WAIT_ON_CNT, LED_ON);
end package std_definitions;

use work.std_definitions.all;

-- arch

architecture behav of fsm is
	-- signals and constants
	constant max_counter : natural := 10;
	signal fsm_state, next_fsm_state : fsm_state_type;

begin
	-- Register Process: Reset and Clock behavior
	reg_proc : process (clk_i, rst_i)
	begin
		if rst_i = '1' then
			fsm_state <= START;
		elsif rising_edge(clk_i) then
			fsm_state <= next_fsm_state;
		end if;
	end process reg_proc;

	-- Process: Statemachine
	fsm_combinatoric : process (start_button_i, counter_value_i, fsm_state) is
	begin
		-- Set default States
		next_fsm_state <= fsm_state;
		counter_restart_strobe_o <= '0';
		led_o <= '0';

		case fsm_state is
			when START =>
				if start_button_i = '1' then
					counter_restart_strobe_o <= '1';
					next_fsm_state <= WAIT_ON_CNT;
				end if;

			when WAIT_ON_CNT =>
				if counter_value_i = max_counter then 
					counter_restart_strobe_o <= '1';
					next_fsm_state <= LED_ON;
				end if;

			when LED_ON =>
				led_o <= '1';
				if counter_value_i = max_counter then 
					counter_restart_strobe_o <= '1';
					next_fsm_state <= START;
				end if;

			when others => 
				next_fsm_state <= START;
		end case;
	end process fsm_combinatoric;
	
end behav;