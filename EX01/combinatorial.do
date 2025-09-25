vlib work
vmap work work

vcom -work work combinatorial_e.vhd
vcom -work work combinatorial_a.vhd
vcom -work work combinatorial_tb.vhd

vsim work.combinatorial_tb

add wave -r *

run 80 ns