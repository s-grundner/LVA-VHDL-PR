library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.std_definitions.all;
use work.commands.all;
entity command_rom is
    port (
        clock_i    : in std_ulogic;
        addr_i     : in  unsigned(COMCNTBW-1 downto 0);
        data_o     : out std_ulogic_vector(2*SERVO_CNT_LEN-1 downto 0)
    );
end entity command_rom;


architecture rtl of command_rom is
signal ROMMEM : TCOMMANDS := COMMANDSTOPROCESS;
begin


process(clock_i)
begin
  if rising_edge(clock_i) then
    data_o <= ROMMEM(to_integer(addr_i));
  end if;
end process;
end architecture;
