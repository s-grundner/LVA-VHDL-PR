vlib work
vmap work work

vcom -work work counter_e.vhd
vcom -work work counter_a.vhd
vcom -work work strb_generator_e.vhd
vcom -work work strb_generator_a.vhd
vcom -work work strb_generator_tb.vhd

vsim work.strb_generator_tb

add wave -r -color {Cyan} 			-label {CLK} /strb_generator_tb/tb_clk
add wave -r -color {Red} 			-label {RST} /strb_generator_tb/tb_rst
add wave -r -color {Medium Orchid} 	-label {Strobe} /strb_generator_tb/tb_strb
add wave -r -color {Lime Green} 	-label {Next Strobe} /strb_generator_tb/strb_dut/next_strobe
add wave -r -color {Yellow} 		-label {Strobe CNT} /strb_generator_tb/strb_dut/strb_counter
add wave -r -color {Orange} 		-label {Next CNT} /strb_generator_tb/strb_dut/counter/next_cnt

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	