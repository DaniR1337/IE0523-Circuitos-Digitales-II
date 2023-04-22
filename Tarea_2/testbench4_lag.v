`timescale 1ns/1ns
`include "cmos_lag_cells.v"
`include "sumador4_synth.v"
`include "probador4.v"

module sumador4_tb;

    // Inputs
    wire CLK;
    wire ENB;
    wire [1:0] MODO;
    wire [3:0] A;
    wire [3:0] B;
    wire RCI;

    // Outputs
    wire [3:0] Q;
    wire RCO;

    initial begin
        $dumpfile("sumador4_tb_lag.vcd");
        $dumpvars(0, sumador4_tb);
    end

    // Instantiate the design under test as well as the tester
    sumador4 U0 (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );
    probador4 P0 (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );

endmodule