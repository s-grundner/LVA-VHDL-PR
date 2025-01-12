vlib work
vmap work work

vcom -work work ../moving_average_ea.vhd
vcom -work work ../test/moving_average_tb.vhd

vsim work.moving_average_filter_tb

add wave -noupdate -label CLK /moving_average_filter_tb/clk_tb
add wave -noupdate -label RST /moving_average_filter_tb/rst_tb
add wave -noupdate -color Coral -label DATA_IN -radix unsigned /moving_average_filter_tb/data_in_tb
add wave -noupdate -color Coral -label DATA_OUT -radix unsigned /moving_average_filter_tb/data_out_tb
add wave -noupdate -color {Slate Blue} -label FILTER_REG -radix unsigned -childformat {{/moving_average_filter_tb/moving_average_filter_dut/filter_reg(0) -radix unsigned} {/moving_average_filter_tb/moving_average_filter_dut/filter_reg(1) -radix unsigned} {/moving_average_filter_tb/moving_average_filter_dut/filter_reg(2) -radix unsigned} {/moving_average_filter_tb/moving_average_filter_dut/filter_reg(3) -radix unsigned}} -expand -subitemconfig {/moving_average_filter_tb/moving_average_filter_dut/filter_reg(0) {-color {Slate Blue} -height 22 -radix unsigned} /moving_average_filter_tb/moving_average_filter_dut/filter_reg(1) {-color {Slate Blue} -height 22 -radix unsigned} /moving_average_filter_tb/moving_average_filter_dut/filter_reg(2) {-color {Slate Blue} -height 22 -radix unsigned} /moving_average_filter_tb/moving_average_filter_dut/filter_reg(3) {-color {Slate Blue} -height 22 -radix unsigned}} /moving_average_filter_tb/moving_average_filter_dut/filter_reg
add wave -noupdate -label {Current Sum} -radix unsigned /moving_average_filter_tb/moving_average_filter_dut/sum

add wave -noupdate -label {Strobe In} /moving_average_filter_tb/moving_average_filter_dut/strb_data_valid_i
add wave -noupdate -label {Strobe Out} /moving_average_filter_tb/moving_average_filter_dut/strb_data_valid_o

run 1200 ns

WaveRestoreZoom {0 ps} {1200 ns}	

configure wave -justifyvalue left
configure wave -namecolwidth 300
configure wave -valuecolwidth 250

update
