vlib work
vmap work work

vcom -work work adder_e.vhd
vcom -work work adder_a.vhd
vcom -work work adder_tb.vhd

# vsim work.adder_tb(test_adder_4)
vsim work.adder_tb(test_adder_12)

add wave -r *

run 100 ns