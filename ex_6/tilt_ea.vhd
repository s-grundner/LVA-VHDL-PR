library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.servo_pkg.all;

-- entity

entity tilt is
    port (
        clk_i    : in std_ulogic;
        rst_i    : in std_ulogic;
        value_i  : in unsigned(15 downto 0);
        on_cnt_o : out unsigned(SERVO_RESOLUTION-1 downto 0)
    );
end tilt ;

architecture behav of tilt is

    signal next_on_cnt : unsigned(SERVO_RESOLUTION-1 downto 0);

begin

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            on_cnt_o <= to_unsigned(SERVO_MIN_ANGLE, SERVO_RESOLUTION);
        end if;
        if rising_edge(clk_i) then
            on_cnt_o <= next_on_cnt;
        end if;
    end process reg_seq;

    comb_tilt : process(value_i) is
    begin
        if(value_i < ADC_MIN_ANGLE) then
            next_on_cnt <= to_unsigned(SERVO_MIN_ANGLE, SERVO_RESOLUTION);
        elsif(value_i > ADC_MAX_ANGLE) then
            next_on_cnt <= to_unsigned(SERVO_MAX_ANGLE, SERVO_RESOLUTION);
        else
            next_on_cnt <= to_unsigned(SERVO_MIN_ANGLE + SERVO_RANGE * (to_integer(value_i) - ADC_MIN_ANGLE) / ADC_RANGE, SERVO_RESOLUTION);
        end if;
    end process comb_tilt;

end architecture ; -- behav