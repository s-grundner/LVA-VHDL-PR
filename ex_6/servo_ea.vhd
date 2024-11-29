library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.servo_pkg.all;

-- entity

entity servo is
	port (
		clk_i : in std_logic;
		rst_i : in std_logic;
		encoded_angle_i : in unsigned(SERVO_RESOLUTION-1 downto 0);
		pwm_o : out std_logic
	);

end servo;

-- architecture

architecture behav of servo is

	constant PWM_MAX_COUNT : natural := SERVO_RESOLUTION**2 - 1;

	signal ON_counter_val, next_On_counter_val : unsigned(SERVO_RESOLUTION-1 downto 0);

begin

	pwm_ent : entity work.pwm(behav)
		generic map (
			COUNTER_LEN => SERVO_RESOLUTION
		)
		port map (
			clk_i => clk_i,
			rst_i => rst_i,
			Period_counter_val_i => to_unsigned(PWM_MAX_COUNT, SERVO_RESOLUTION),
			ON_counter_val_i => encoded_angle_i,
			PWM_o => pwm_o
		);
		
	reg_seq : process (clk_i, rst_i) is
	begin
		if rst_i = '1' then
			ON_counter_val <= (others => '0');
		elsif rising_edge(clk_i) then
			ON_counter_val <= next_On_counter_val;
		end if;
	end process reg_seq;

	servo_comb : process (encoded_angle_i) is
	begin
		next_On_counter_val <= encoded_angle_i;
	end process servo_comb;

end architecture;