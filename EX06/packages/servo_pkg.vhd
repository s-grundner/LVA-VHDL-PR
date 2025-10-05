library ieee;
use ieee.math_real.all;

package servo_pkg is
    constant F_SERVO     : natural := 50;     -- Servo PWM
    constant F_SAMPlE    : natural := 50;     -- ADC Samplingrate
    constant F_ADC       : natural := 50_000; -- ADC PWM
    constant F_CLK       : natural := 50_000_000;
    
    constant ADC_MAX_VAL    : natural := 250; -- 5V -> f_clk / f_adc
    constant ADC_MAX_ANGLE  : natural := 150; -- 3V -> 180°
    constant ADC_MIN_ANGLE  : natural := 100; -- 2V -> 0°
    constant ADC_RANGE      : natural := ADC_MAX_ANGLE - ADC_MIN_ANGLE;

    constant SERVO_RESOLUTION : natural := 20;    -- ld(f_clk / f_servo)
    constant ADC_RESOLUTION   : natural := 8;     -- ld(ADC_MAX_VAL)
    constant ADC_SAMPLING_PSC : natural := 4000;  -- f_adc / f_sampling

    constant SERVO_MAX_VAL   : natural := 1000000; -- f_clk / f_servo
    constant SERVO_MIN_ANGLE : natural := 400000;  -- 0°   -> SERVO_MAX_VAL*(ADC_MIN_ANGLE/ADC_MAX_VAL)
    constant SERVO_MAX_ANGLE : natural := 600000;  -- 180° -> SERVO_MAX_VAL*(ADC_MAX_ANGLE/ADC_MAX_VAL)
    constant SERVO_RANGE     : natural := SERVO_MAX_ANGLE - SERVO_MIN_ANGLE;
end package servo_pkg;
