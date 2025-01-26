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

architecture behav of servo is

    signal on_cnt_val, next_on_cnt_val : unsigned(SERVO_RESOLUTION-1 downto 0) := to_unsigned(SERVO_MIN_ANGLE, SERVO_RESOLUTION);
    signal pwm : std_logic := '0';

begin

    pwm_ent : entity work.pwm(behav)
    generic map (
        CNT_LEN => SERVO_RESOLUTION
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        period_cnt_val_i => to_unsigned(SERVO_MAX_VAL, SERVO_RESOLUTION),
        on_cnt_val_i => on_cnt_val,
        pwm_o => pwm
    );
        
    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            on_cnt_val <= (others => '1');
        elsif rising_edge(clk_i) then
            on_cnt_val <= next_on_cnt_val;
        end if;
    end process reg_seq;

    next_on_cnt_val <= angle_i when pwm = '1' else on_cnt_val;
    pwm_o <= pwm;

end architecture;