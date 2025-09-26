--------------------------------------------------------------------------------
-- file: counter_e.vhd
-- type: Entity
-- author: Simon Grundner (k12136610)
-- brief: Counter module declaration
--------------------------------------------------------------------------------

-- ENTITY

entity counter is
    port (
        clk_i                    : in bit;
        rst_i                    : in bit;
        counter_restart_strobe_i : in bit;
        counter_value_o          : out natural
    );
end entity counter;
