library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;
use work.std_definitions.all;
use work.commands.all;

entity cmd_rom is
    port (
        clk_i  : in std_ulogic;
        addr_i : in  unsigned(COMCNTBW-1 downto 0);
        data_o : out std_ulogic_vector(2*SERVO_RESOLUTION-1 downto 0)
    );
end entity cmd_rom;


architecture rtl of cmd_rom is
    signal ROMMEM : TCOMMANDS := COMMANDSTOPROCESS;
begin


process(clk_i)
begin
    if rising_edge(clk_i) then
        data_o <= ROMMEM(to_integer(addr_i));
    end if;
end process;
end architecture;
