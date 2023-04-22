all: ver 

compilar:
	@ iverilog -o sumador4_tb.vvp testbench4.v
	@ iverilog -o sumador8_tb.vvp testbench8.v
	@ iverilog -o sumador32_tb.vvp testbench32.v

	@ vvp sumador4_tb.vvp
	@ vvp sumador8_tb.vvp
	@ vvp sumador32_tb.vvp

ver: compilar
	@ gtkwave sumador4_tb.vcd & 
	@ gtkwave sumador8_tb.vcd & 
	@ gtkwave sumador32_tb.vcd & 

clean:
	@ rm *.vcd
	@ rm *.vvp