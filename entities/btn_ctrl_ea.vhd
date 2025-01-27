library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity btn_ctrl is
    generic (
        REG_SIZE : natural := ADC_RESOLUTION;
        REG_MAX_VAL : unsigned := ADC_MAX_ANGLE;
        REG_MIN_VAL : unsigned := ADC_MIN_ANGLE
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;
        
        sw_mode_async_i : in std_ulogic;
        btn_inc_async_i : in std_ulogic;
        btn_dec_async_i : in std_ulogic;

        dbg_val_o : out unsigned(REG_SIZE-1 downto 0);
        dbg_valid_strb_o : out std_ulogic
    );
end btn_ctrl;

-- architecture

architecture rtl of btn_ctrl is

    constant REG_RANGE : unsigned := REG_MAX_VAL - REG_MIN_VAL;
    type fsm_state_type is (IDLE, INCREMENT, DECREMENT);
    signal curr_state, next_state       : fsm_state_type;
    signal curr_register, next_register : unsigned(REG_SIZE-1 downto 0);
    signal btn_inc, btn_dec, sw_mode    : std_ulogic;

begin

    dbg_val_o <= curr_register;

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_state    <= IDLE;
            curr_register <= shift_right(REG_RANGE, 1); -- default is half of the range
        elsif rising_edge(clk_i) then
            curr_state    <= next_state;
            curr_register <= next_register;
        end if;
    end process reg_seq;

    -- FSM

    fsm_comb : process(curr_state, btn_inc, btn_dec, sw_mode, curr_register) is
        variable step_size : unsigned(REG_SIZE-1 downto 0);
    begin
        if sw_mode = '1' then
            step_size := to_unsigned(10, REG_SIZE);
        else
            step_size := to_unsigned(1, REG_SIZE);
        end if;

        next_state <= curr_state;
        next_register <= curr_register;
        dbg_valid_strb_o <= '0';

        case curr_state is
            when IDLE =>
                dbg_valid_strb_o <= '1';
                if btn_inc = '1' then
                    if curr_register > REG_MAX_VAL - step_size then
                        next_register <= REG_MAX_VAL - 1;
                    else
                        next_register <= curr_register + step_size;
                    end if;
                    next_state <= INCREMENT;
                elsif btn_dec = '1' then
                    if curr_register < step_size then
                        next_register <= (others => '0');
                    else
                        next_register <= curr_register - step_size;
                    end if;
                    next_state <= DECREMENT;
                end if;
            when INCREMENT =>
                if btn_inc = '0' then
                    next_state <= IDLE;
                end if;
            when DECREMENT =>
                if btn_dec = '0' then
                    next_state <= IDLE;
                end if;
        end case;
    end process fsm_comb;

    -- synchronize and debounce inputs

    inc_clean_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => btn_inc_async_i,
            btn_o => btn_inc
        );

    dec_clean_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => btn_dec_async_i,
            btn_o => btn_dec
        );

    sw_clean_ent : entity work.clean_btn(rtl)
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            btn_i => sw_mode_async_i,
            btn_o => sw_mode
        );

end architecture rtl; -- rtl

