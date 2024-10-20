
-- Enumerations

library IEEE;
use IEEE.std_logic_1164.all;
use work.std_definitions.all;

package std_definitions is
    type blink_fsm_state_type is (START, WAIT_2s, LED_ON );
end package std_definitions;

-- Modelling Memory: Register Process

reg_proc : process (reset_i, clock_i) is
begin
    if reset_i = '1' then
    elsif rising_edge(clock_i) then
    
		-- code

    end if;
end process;

-- Reset and next state Logic

reg_proc : process (reset_i, clock_i) is
begin
    if reset_i = '1' then
        state <= '0';
    elsif rising_edge(clock_i) then
        state <= next_state;
    end if;
end process;


next_state_logic : process (state) is
begin
    -- default assignment
    next_state <= state;
    -- calculate next_state out of state
end process;

-- Modeling next state logic

fsm_combinatoric : process (start_button_i, counter_value_i, blink_fsm_state) is
begin
    next_blink_fsm_state <= blink_fsm_state; -- default next state is the prev state

    case blink_fsm_state is
        when START =>
            if ... then
                ...
                next_blink_fsm_state <= ;
            end if;
        when WAIT_2s =>
            if ... Ethen
                ...
                next_blink_fsm_state <= ;
            end if;
        when LED_ON =>
            if ... then
                ...
                next_blink_fsm_state <= ;
            end if;
        when others => next_blink_fsm_state <= START;
    end case;
end process;

-- 