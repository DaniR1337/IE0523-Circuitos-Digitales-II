all: ver clean

compilar:
	@ iverilog -o sumador32_tb.vvp sumador32_tb.v
	@ vvp sumador32_tb.vvp

ver: compilar
	@ gtkwave sumador32_tb.vcd & 
