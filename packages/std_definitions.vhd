library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.math_real.all;

package std_definitions is
    --synthesis translate_off
	--constant debouncecount : natural := 500000; -- 1ms = 1s/1000 = 50Mhz s / 1000 = 50000
	--synthesis translate_on
    
    constant F_CLK    : natural := 50_000_000;
    constant F_ADC    : natural := 200_000; -- ADC PWM
    constant F_SERVO  : natural := 50;      -- Servo PWM
    constant F_SAMPlE : natural := 50;      -- ADC Samplingrate
    
    constant ADC_SAMPLING_PSC : natural := F_ADC / F_SAMPLE;

    constant ADC_RESOLUTION : natural := natural(ceil(log2(real(F_CLK / F_ADC))));
    constant ADC_MAX_VAL    : unsigned(ADC_RESOLUTION-1 downto 0) := to_unsigned(F_CLK / F_ADC, ADC_RESOLUTION); -- 5V
    constant ADC_MAX_ANGLE  : unsigned(ADC_RESOLUTION-1 downto 0) := to_unsigned(150, ADC_RESOLUTION); -- Old range 150: 3V -> 180°
    constant ADC_MIN_ANGLE  : unsigned(ADC_RESOLUTION-1 downto 0) := to_unsigned(100, ADC_RESOLUTION); -- Old range 100: 2V -> 0°
    constant ADC_RANGE      : unsigned(ADC_RESOLUTION-1 downto 0) := ADC_MAX_ANGLE - ADC_MIN_ANGLE;
    
    constant SERVO_RESOLUTION : natural := natural(ceil(log2(real(F_CLK / F_SERVO))));
    constant SERVO_MAX_VAL    : unsigned(SERVO_RESOLUTION-1 downto 0) := to_unsigned(F_CLK / F_SERVO, SERVO_RESOLUTION);
    constant SERVO_MIN_ANGLE  : unsigned(SERVO_RESOLUTION-1 downto 0) := to_unsigned(40_000, SERVO_RESOLUTION);  -- 0°   1ms (- 10_000 for Saturation)
    constant SERVO_MAX_ANGLE  : unsigned(SERVO_RESOLUTION-1 downto 0) := to_unsigned(110_000, SERVO_RESOLUTION); -- 180° 2ms (+ 10_000 for Saturation)
    constant SERVO_RANGE      : unsigned(SERVO_RESOLUTION-1 downto 0) := SERVO_MAX_ANGLE - SERVO_MIN_ANGLE;

    constant MICRO_STEP_TIME_PS : natural := 1_000_000; -- f_clk * 1/50s * (1/2**4 faster sim)
    constant DEFAULT_N_SYNC_DFF : natural := 3;
	constant DEBOUNCE_CNT_MAX   : natural := 5000;
    constant FILTER_ORDER       : natural := 3;
end package std_definitions;