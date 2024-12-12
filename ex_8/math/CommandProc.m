clear all
close all

commands = [% waypoints in pseudo x,y coordinates
            0, 0
            0, 110
            40, 0
            0, -110
            50, 100
            30, 0
            -50, -100
            50, -100
            -30, 0
            -50, 100
            0, -110
            -40, 0
            0, 220
            0, 0 % last two commands have to be a zero to allow for pen-up
            0, 0
            ];

ServoDegree0 = 40000; % count values for digitial Servos for 0 and 180 degrees
ServoDegree180 = 110000;

ServoScalingFactor = (ServoDegree180 - ServoDegree0) / 180;

commands = commands * ServoScalingFactor;

DivisionFactorxy = 4; % division factor for generating waypoints
DivisionFactorpolar = 16; % division factor for partial movements in digital design

Positions = [52000, 0];

for i = 1:size(commands, 1)
    deltax = commands(i, 1) / DivisionFactorxy;
    deltay = commands(i, 2) / DivisionFactorxy;

    for i = 1:DivisionFactorxy
        Positions(end + 1, :) = Positions(end, :) + [deltax, deltay];
    end

end

figure
stem(Positions(:, 1), Positions(:, 2))
axis([-max(Positions(:, 1)) * 1.2 max(Positions(:, 1)) * 1.2 -max(Positions(:, 1)) * 1.2 max(Positions(:, 1)) * 1.2])
title('way points')

grid on

% now do it in polar coords:
polar_start = [0, 0];
cmplxcummsumcommands = Positions(:, 1) + 1i * Positions(:, 2);
cummsumcommandspolar = [abs(cmplxcummsumcommands), unwrap(angle(cmplxcummsumcommands))];
commandspolar = [polar_start(1, :); diff(cummsumcommandspolar, 1)];

commandspolar = [round(commandspolar(:, 1)), commandspolar(:, 2)];

polar_out = [commandspolar(:, 1), floor(commandspolar(:, 2) / pi * (ServoDegree180 - ServoDegree0))]; % next integer

nCommands = size(polar_out, 1); % number of commands

% write package with Commands
f = fopen('./Commands_p.vhd', 'w');
fprintf(f, 'library ieee;\n');
fprintf(f, 'use ieee.std_logic_1164.all;\n');
fprintf(f, 'use ieee.numeric_std.all;\n');
fprintf(f, 'use work.all;\n');
fprintf(f, 'use work.std_definitions.all;\n');
fprintf(f, '\n');
fprintf(f, 'package commands is\n');
fprintf(f, '\n');

fprintf(f, 'constant NCOMMANDS : natural := %d;\n', nCommands); % write how many commands are there
fprintf(f, 'constant COMCNTBW : natural := %d;\n', ceil(log2(nCommands))); % write how many commands are there
fprintf(f, 'constant DIVFACTORBW : natural := %d;\n', log2(DivisionFactorpolar)); % write how many commands are there

fprintf(f, '\n');
fprintf(f, 'type TCOMMANDS is array (0 to NCOMMANDS-1)  of std_ulogic_vector(2*SERVO_CNT_LEN-1 downto 0);\n');
fprintf(f, '\n');
fprintf(f, 'constant COMMANDSTOPROCESS : TCOMMANDS := ( \n');

for i = 1:nCommands

    if i ~= nCommands
        fprintf(f, '(std_ulogic_vector(to_signed(%d, SERVO_CNT_LEN)) & std_ulogic_vector(to_signed(%d, SERVO_CNT_LEN)) ),\n', polar_out(i, 1), polar_out(i, 2));
    else
        fprintf(f, '(std_ulogic_vector(to_signed(%d, SERVO_CNT_LEN)) & std_ulogic_vector(to_signed(%d, SERVO_CNT_LEN) )));\n', polar_out(i, 1), polar_out(i, 2));
    end

end

fprintf(f, '\n');
fprintf(f, 'end package;\n');

fclose(f);

% write CommandROM entity
f = fopen('./CommandROM_ea.vhd', 'w');
fprintf(f, 'library ieee;\n');
fprintf(f, 'use ieee.std_logic_1164.all;\n');
fprintf(f, 'use ieee.numeric_std.all;\n');
fprintf(f, 'use work.all;\n');
fprintf(f, 'use work.std_definitions.all;\n');
fprintf(f, 'use work.commands.all;\n');

fprintf(f, 'entity command_rom is\n');
fprintf(f, '    port (\n');
fprintf(f, '        clock_i    : in std_ulogic;\n');
fprintf(f, '        addr_i     : in  unsigned(COMCNTBW-1 downto 0);\n');
fprintf(f, '        data_o     : out std_ulogic_vector(2*SERVO_CNT_LEN-1 downto 0)\n');
fprintf(f, '    );\n');
fprintf(f, 'end entity command_rom;\n');
fprintf(f, '\n');
fprintf(f, '\n');
fprintf(f, 'architecture rtl of command_rom is\n');
fprintf(f, 'signal ROMMEM : TCOMMANDS := COMMANDSTOPROCESS;\n');
fprintf(f, 'begin\n');

fprintf(f, '\n');
fprintf(f, '\n');
fprintf(f, 'process(clock_i)\n');
fprintf(f, 'begin\n');
fprintf(f, '  if rising_edge(clock_i) then\n');
fprintf(f, '    data_o <= ROMMEM(to_integer(addr_i));\n');
fprintf(f, '  end if;\n');
fprintf(f, 'end process;\n');
fprintf(f, 'end architecture;\n');

fclose(f);

% code simulating digital implementation
PositionsPolar = Positions(1, :);

for i = 1:size(commandspolar, 1)
    deltar = commandspolar(i, 1) / DivisionFactorpolar;
    deltatheta = commandspolar(i, 2) / DivisionFactorpolar;

    for i = 1:DivisionFactorpolar
        PositionsPolar(end + 1, :) = PositionsPolar(end, :) + [deltar, deltatheta];
    end

end

% plotting

CommandsPolarDeg = [commandspolar(:, 1) commandspolar(:, 2) / pi * 180];

servooutinc = PositionsPolar(:, 1) .* exp(1i * PositionsPolar(:, 2));
servooutinc = floor([real(servooutinc), imag(servooutinc)]);

figure
plot(servooutinc(:, 1), servooutinc(:, 2))
hold on
stem(servooutinc(:, 1), servooutinc(:, 2))
axis([-max(servooutinc(:, 1)) * 1.2 max(servooutinc(:, 1)) * 1.2 -max(servooutinc(:, 1)) * 1.2 max(servooutinc(:, 1)) * 1.2])
title('servo incremental')

grid on
