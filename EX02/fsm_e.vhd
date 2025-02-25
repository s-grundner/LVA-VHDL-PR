--------------------------------------------------------------------------------
-- file: fsm_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: Finite state machine module declaration
--------------------------------------------------------------------------------

-- ENTITY 

entity fsm is
    port (
        clk_i                       : in bit;
        rst_i                       : in bit;
        start_button_i              : in bit;
        counter_value_i             : in natural;
        counter_restart_strobe_o    : out bit;
        led_o                       : out bit
    );
end entity fsm;
