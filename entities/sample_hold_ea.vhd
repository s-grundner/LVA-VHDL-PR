library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.std_definitions.all;

-- entity

entity sample_hold is
    port (
        clk_i      : in std_ulogic;
        rst_i      : in std_ulogic;
        strb_i     : in std_ulogic;
        val_i 	   : in unsigned(ADC_RESOLUTION-1 downto 0);
        hold_val_o : out unsigned(15 downto 0)
    );
end sample_hold;

architecture behav of sample_hold is

    signal hold_val, next_hold_val : unsigned(15 downto 0) := (others => '0');

begin

    reg_seq : process(clk_i, rst_i) is
    begin
        if rst_i = '1' then
            hold_val <= (others => '0');
        elsif rising_edge(clk_i) then
            hold_val <= next_hold_val;
        end if;
    end process reg_seq;

    next_hold_val <= resize(val_i, 16) when strb_i = '1' else hold_val;
    hold_val_o <= hold_val;

end architecture behav;