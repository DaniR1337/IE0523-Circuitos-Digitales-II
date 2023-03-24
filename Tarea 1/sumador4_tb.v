`timescale 1ns/1ns
`include "sumador4.v"


module sumador4_tb;

    // Inputs
    reg CLK;
    reg ENB;
    reg [1:0] MODO;
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [3:0] Q;
    wire RCO;

    // Instantiate the design under test
    sumador4 dut (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );

    // Initialize the inputs
    initial begin
        $dumpfile("sumador4_tb.vcd");
        $dumpvars(0, sumador4_tb);
        CLK = 0;
        ENB = 1;
        MODO = 2'b01;
        A = 4;
        B = 3;

        #10;
        A = 7;
        B = 2;

        #10;
        A = 1;
        B = 6;

        #10;
        A = 0;
        B = 0;

        #10;
        $finish;
    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;

    
    

endmodule
