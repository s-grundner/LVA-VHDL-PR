library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity btn_ctrl is
    generic (
        REG_SIZE : natural := ADC_RESOLUTION
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;
        
        sw_mode_i : in std_ulogic;
        btn_inc_i : in std_ulogic;
        btn_dec_i : in std_ulogic;

        adc_val_o : out unsigned(REG_SIZE-1 downto 0);
        adc_valid_strb_o : out std_ulogic
    );
end btn_ctrl;

-- architecture

architecture behav of btn_ctrl is

    constant REG_MAX_VAL : unsigned(REG_SIZE-1 downto 0) := (others => '1');
    constant DEBOUNCE : natural := 2;

    type fsm_state_type is (IDLE, INCREMENT, DECREMENT);
    signal curr_state, next_state : fsm_state_type := IDLE;
    signal btn_inc_sync, btn_dec_sync, sw_mode_sync : std_ulogic := '0';
    signal curr_register, next_register : unsigned(REG_SIZE-1 downto 0) := shift_right(REG_MAX_VAL, 1);

begin

    adc_val_o <= curr_register;

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_state <= IDLE;
            curr_register <= shift_right(REG_MAX_VAL, 1);
        elsif rising_edge(clk_i) then
            curr_state <= next_state;
            curr_register <= next_register;
        end if;
    end process reg_seq;

    -- FSM

    fsm_comb : process(curr_state, btn_inc_sync, btn_dec_sync, sw_mode_sync, curr_register) is
        variable step_size : natural := 1;
    begin
        if sw_mode_sync = '1' then
            step_size := 10;
        else
            step_size := 1;
        end if;

        next_state <= curr_state;
        next_register <= curr_register;
        adc_valid_strb_o <= '1';

        case curr_state is
            when IDLE =>
                adc_valid_strb_o <= '0';
                if btn_inc_sync = '1' then
                    next_state <= INCREMENT;
                elsif btn_dec_sync = '1' then
                    next_state <= DECREMENT;
                end if;
            when INCREMENT =>
                if curr_register > REG_MAX_VAL - step_size then
                    next_register <= REG_MAX_VAL-1;
                else
                    next_register <= curr_register + step_size;
                end if;
                if btn_inc_sync = '0' then
                    next_state <= IDLE;
                end if;
            when DECREMENT =>
                if curr_register < step_size then
                    next_register <= (others => '0');
                else
                    next_register <= curr_register - step_size;
                end if;
                if btn_dec_sync = '0' then
                    next_state <= IDLE;
                end if;
        end case;
    end process fsm_comb;

    -- debounce

    inc_sync_ent : entity work.sync(behav)
        generic map (
            N_DFF => DEBOUNCE
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sig_i => btn_inc_i,
            sig_o => btn_inc_sync
        );
    
    dec_sync_ent : entity work.sync(behav)
        generic map (
            N_DFF => DEBOUNCE
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sig_i => btn_dec_i,
            sig_o => btn_dec_sync
        );

    sw_sync_ent	: entity work.sync(behav)
        generic map (
            N_DFF => DEBOUNCE
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            sig_i => sw_mode_i,
            sig_o => sw_mode_sync
        );

end architecture behav; -- behav

