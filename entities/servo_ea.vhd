library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity servo is
    port (
        clk_i : in std_logic;
        rst_i : in std_logic;
        angle_i : in unsigned(SERVO_RESOLUTION-1 downto 0);
        pwm_o : out std_logic
    );
end servo;

-- architecture

architecture rtl of servo is

    signal on_cnt_val, next_on_cnt_val : unsigned(SERVO_RESOLUTION-1 downto 0);
    signal pwm : std_logic := '0';

begin

    pwm_ent : entity work.pwm(rtl)
    generic map (
        CNT_LEN => SERVO_RESOLUTION
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        period_cnt_val_i => SERVO_MAX_VAL,
        on_cnt_val_i => on_cnt_val,
        pwm_o => pwm
    );
        
    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            on_cnt_val <= SERVO_MIN_ANGLE;
        elsif rising_edge(clk_i) then
            on_cnt_val <= next_on_cnt_val;
        end if;
    end process reg_seq;

    next_on_cnt_val <= angle_i when pwm = '1' else on_cnt_val;
    pwm_o <= pwm;

end architecture;