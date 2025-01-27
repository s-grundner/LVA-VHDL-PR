library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity tilt is
    port (
        clk_i   : in std_ulogic;
        rst_i   : in std_ulogic;
        adc_i   : in unsigned(ADC_RESOLUTION-1 downto 0);
        angle_o : out unsigned(SERVO_RESOLUTION-1 downto 0)
    );
end tilt ;

architecture rtl of tilt is

    signal ltd_angle : unsigned(SERVO_RESOLUTION-1 downto 0) := (others => '0');
    constant ADC_TO_SERVO_OFS : unsigned(SERVO_RESOLUTION-1 downto 0) :=
        SERVO_MIN_ANGLE - (SERVO_RANGE + ADC_MIN_ANGLE) / ADC_RANGE;
begin

    angle_o <= ltd_angle;

    limit_tilt : process(adc_i) is
    begin
        ltd_angle <= resize(SERVO_RANGE * adc_i + ADC_TO_SERVO_OFS, SERVO_RESOLUTION);
        if(adc_i < ADC_MIN_ANGLE) then
            ltd_angle <= SERVO_MIN_ANGLE;
        elsif(adc_i > ADC_MAX_ANGLE) then
            ltd_angle <= SERVO_MAX_ANGLE;
        end if;
    end process limit_tilt;

end architecture;