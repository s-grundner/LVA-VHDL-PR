# VDHL - PR

> Project and Exercises from Course "Hardwaredesign mit VHDL - PR" - [Moodle Course](https://moodle.jku.at/course/view.php?id=33858)

## Repository Structure

```text
REPO
 |- entities    ... Generic entities which are reused in exercises
 |- devices     ... QSF files for the Cyclone-V FPGA Board
 |- packages    ... VHDL files containing board parameters
 |- EX*
     |- test    ... Testbenches
     |- sim     ... Modelsim Do-Files
     |- latex   ... Latex Sources
     |- quartus ... Quartus Project (if available)
     *.vhd      ... VHDL Sources
```

The [entities](/entities) directory is a pool of modules which where implemented during the elaboration of the exercises. These modules build upon each other up to the Final Project in [Exercise 11](EX11/)

## Overview

List which Exercise implements modules into and uses modules from the entites directory.

| Exercise | Report | Keywords | Implements Module | Reuses Modules |
| :-: | - | - | - | - |
| [01](EX01/) | [EX01-k12136610.pdf](docs/EX01-k12136610.pdf) | Combinatorial Circuits, Adder, Entities and Architectures |                           |                |
| [02](EX02/) | [EX02-k12136610.pdf](docs/EX02-k12136610.pdf) | Sequential Circuits, FSM      | counter, fsm              |                |
| [03](EX03/) | [EX03-k12136610.pdf](docs/EX03-k12136610.pdf) | Pulse Width Modulation        | pwm                       | counter        |
| [04](EX04/) | [EX04-k12136610.pdf](docs/EX04-k12136610.pdf) | Delta ADC | delta_adc, strb_generator | pwm, counter   |
| [05](EX05/) | [EX05-k12136610.pdf](docs/EX05-k12136610.pdf) | Servo Driver, Programming the FPGA Dev-Board, LED Blink Project, VHDL Packages | servo, sync | counter, pwm |
| [06](EX06/) | [EX06-k12136610.pdf](docs/EX06-k12136610.pdf) | Delta ADC, 7-Segment, Servo Driver, Module Interconnection | sample_hold, bin2bcd, bdc_to_7seg | counter, pwm, servo, strb_generator, sync, delta_adc |
| [07](EX07/) | [EX07-k12136610.pdf](docs/EX07-k12136610.pdf) |  |  |  |
| [08](EX08/) | [EX08-k12136610.pdf](docs/EX08-k12136610.pdf) |  |  |  |
| [09](EX09/) | [EX09-k12136610.pdf](docs/EX09-k12136610.pdf) |  |  |  |
| [10](EX10/) | [EX10-k12136610.pdf](docs/EX10-k12136610.pdf) |  |  |  |
| [11](EX11/) | [EX11-k12136610.pdf](docs/EX11-k12136610.pdf) |  |  |  |
