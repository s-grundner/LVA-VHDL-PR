library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.servo_pkg.all;

-- entity

entity sample_hold is
    port (
        clk_i        : in std_ulogic;
        rst_i        : in std_ulogic;
        strb_i       : in std_ulogic;
        value_i 	 : in unsigned(ADC_RESOLUTION-1 downto 0);
        hold_value_o : out unsigned(15 downto 0)
    );
end sample_hold;

architecture behav of sample_hold is

    signal hold_value : unsigned(15 downto 0) := (others => '0');
    signal next_hold_value : unsigned(15 downto 0) := (others => '0');

begin

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            hold_value <= (others => '0');
        elsif rising_edge(clk_i) then
            hold_value <= next_hold_value;
        end if;
    end process reg_seq;

    hold_comb : process(strb_i, value_i) is
    begin
        next_hold_value <= hold_value;
        if strb_i = '1' then
            next_hold_value <= resize(value_i, 16);
        end if;
    end process hold_comb;

    hold_value_o <= hold_value;

end architecture behav;