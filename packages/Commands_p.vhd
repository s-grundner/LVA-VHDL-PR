library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;
use work.std_definitions.all;

package commands is

constant NCOMMANDS : natural := 61;
constant COMCNTBW : natural := 6;
constant DIVFACTORBW : natural := 4;

type TCOMMANDS is array (0 to NCOMMANDS-1)  of std_ulogic_vector(2*SERVO_RESOLUTION-1 downto 0);

constant COMMANDSTOPROCESS : TCOMMANDS := ( 
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(1088, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(4519, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(3139, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(4175, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(4874, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(3622, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(6233, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(3021, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(3047, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-783, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(3126, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-717, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(3196, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-658, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(3257, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-605, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-5174, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-2699, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-3926, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-3048, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-2464, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-3334, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-841, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-3499, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(5511, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(2973, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(6620, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(2518, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(7477, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(2110, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(8133, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(1763, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(2670, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-271, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(2684, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-257, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(2696, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-243, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(2708, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-231, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-7819, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-1649, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-7190, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-1922, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-6402, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-2231, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-5421, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-2565, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(5421, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-2565, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(6402, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-2231, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(7190, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-1922, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(7819, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-1649, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-2708, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-231, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-2696, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-243, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-2684, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-257, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-2670, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-271, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-8133, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(1763, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-7477, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(2110, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-6620, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(2518, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-5511, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(2973, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(841, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-3499, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(2464, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-3334, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(3926, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-3048, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(5174, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-2699, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-3257, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-605, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-3196, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-658, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-3126, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-717, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-3047, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(-783, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-11107, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(6643, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(-4227, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(8695, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(4227, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(8695, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(11107, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(6643, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) ),
(std_ulogic_vector(to_signed(0, SERVO_RESOLUTION)) & std_ulogic_vector(to_signed(0, SERVO_RESOLUTION) )));

end package;
