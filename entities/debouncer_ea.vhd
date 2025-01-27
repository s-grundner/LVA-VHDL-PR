library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.std_definitions.all;

entity debouncer is
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;
        sig_i : in std_ulogic;
        sig_o : out std_ulogic
    );
end debouncer ;

architecture rtl of debouncer is

    constant DEBOUNCE_CNT_LEN : natural := natural(ceil(log2(real(DEBOUNCE_CNT_MAX))));
    type fsm_state_type is (IDLE, DEBOUNCING);
    
    signal curr_state, next_state : fsm_state_type;
    signal curr_sig, next_sig : std_ulogic;

    signal sync_rst : std_ulogic := '0';
    signal strb     : std_ulogic := '0';

begin

    sig_o <= curr_sig;

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_sig   <= '0';
            curr_state <= IDLE;
        elsif rising_edge(clk_i) then
            curr_sig   <= next_sig;
            curr_state <= next_state;
        end if;
    end process reg_seq;

    fsm_comb : process(sig_i, curr_sig, curr_state, strb) is
    begin
        next_state <= curr_state;
        next_sig   <= curr_sig;
        sync_rst   <= '1'; -- keep cnt at rst when not debouncing
        case curr_state is
            when IDLE =>
                next_sig <= sig_i;
                if sig_i /= curr_sig then
                    next_state <= DEBOUNCING;
                end if;
            when DEBOUNCING =>
                sync_rst <= '0'; -- release cnt from rst state
                if strb = '1' then
                    next_state <= IDLE;
                end if;
        end case;
    end process fsm_comb;

    strb_ent : entity work.strb_generator(rtl)
    generic map (
        PRESCALER => DEBOUNCE_CNT_MAX 
    )	
    port map (
        clk_i  => clk_i,
        rst_i  => rst_i,
        strb_o => strb,
        sync_rst_i => sync_rst
    );  

end architecture;