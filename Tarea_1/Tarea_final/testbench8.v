`timescale 1ns/1ns
`include "sumador8.v"
`include "probador8.v"

module sumador8_tb;

    // Inputs
    wire CLK;
    wire ENB;
    wire [1:0] MODO;
    wire [7:0] A;
    wire [7:0] B;
    wire RCI;

    // Outputs
    wire [7:0] Q;
    wire RCO;

    initial begin
        $dumpfile("sumador8_tb.vcd");
        $dumpvars(0, sumador8_tb);
    end

    // Instantiate the design under test as well as the tester
    sumador8 U0 (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );
    probador8 P0 (
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