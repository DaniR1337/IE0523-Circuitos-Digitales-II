`timescale 1ns/1ns
`include "sumador32.v"
`include "probador32.v"

module sumador32_tb;

    // Inputs
    wire CLK;
    wire ENB;
    wire [1:0] MODO;
    wire [31:0] A;
    wire [31:0] B;
    wire RCI;

    // Outputs
    wire [31:0] Q;
    wire RCO;

    initial begin
        $dumpfile("sumador32_tb.vcd");
        $dumpvars(0, sumador32_tb);
    end

    // Instantiate the design under test as well as the tester
    sumador32 U0 (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );
    probador32 P0 (
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