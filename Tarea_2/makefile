all: sim 

compilar:
	@ iverilog -o sumador4_tb.vvp testbench4.v
	@ iverilog -o sumador4_tb_lag.vvp testbench4_lag.v

	@ vvp sumador4_tb.vvp
	@ vvp sumador4_tb_lag.vvp

sim: compilar
	@ gtkwave sumador4_tb.vcd & 
	@ gtkwave sumador4_tb_lag.vcd & 

clean:
	@ rm *.vcd
	@ rm *.vvp

yosys:
	@ yosys -s sumador4_RTLIL.ys
	@ yosys -s sumador4.ys