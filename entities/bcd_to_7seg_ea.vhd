library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.std_definitions.all;
use work.all;

entity bcd_to_7seg is
    port (
		bcd_i : in  std_ulogic_vector(3 downto 0);
        led_o : out  std_logic_vector (0 to 6)
    );
end bcd_to_7seg;

architecture behav of bcd_to_7seg is

begin
	
	process(bcd_i)
	begin
		case bcd_i is              --abcdefg
			when "0000" => led_o <= "0000001"; -- 0     
			when "0001" => led_o <= "1001111"; -- 1 
			when "0010" => led_o <= "0010010"; -- 2 
			when "0011" => led_o <= "0000110"; -- 3 
			when "0100" => led_o <= "1001100"; -- 4 
			when "0101" => led_o <= "0100100"; -- 5 
			when "0110" => led_o <= "0100000"; -- 6 
			when "0111" => led_o <= "0001111"; -- 7 
			when "1000" => led_o <= "0000000"; -- 8     
			when "1001" => led_o <= "0000100"; -- 9 
			when "1010" => led_o <= "0000010"; -- a
			when "1011" => led_o <= "1100000"; -- b
			when "1100" => led_o <= "0110001"; -- C
			when "1101" => led_o <= "1000010"; -- d
			when "1110" => led_o <= "0110000"; -- E
			when "1111" => led_o <= "0111000"; -- F
			when others => led_o <= "1111111"; -- switch all off - negated logic
		end case;
	end process;

end architecture;
