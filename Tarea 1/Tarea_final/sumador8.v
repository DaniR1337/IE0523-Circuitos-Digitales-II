/*
Synchronous 8-bit binary adder, with the following modes of operation:
a) Addition
b) Subtraction
c) Hold previous value
d) Clear the adder
*/

`include "sumador4.v"

module sumador8 (   input   CLK,
                    input   ENB,
                    input   RCI,
                    input   [1:0] MODO,
                    input   [7:0] A,
                    input   [7:0] B,
                    output  [7:0] Q,
                    output  RCO);

wire C1;
wire [3:0] Q1, Q2;
reg W1; 
reg [3:0] W2;


// This always block is only for calculating the immediate carry-out (RCO)
// without having to wait a whole clock cycle (since 4-bit adder is synchronous)
// Mode 1 is addition, mode 2 is subtraction.
always @(A or B) begin
    if (MODO == 2'b01) begin
        // Assign immediate carry-out to W1
        {W1, W2} = A[3:0] + B[3:0];
    end

    if (MODO == 2'b10) begin
        {W1, W2} = A[3:0] - B[3:0];
    end

    if (MODO == 2'b11 & RCI == 0) begin
        W1 = 0; // Propagates clean mode to further blocks
    end
end

// sumador4 instances
sumador4 bloque1 (.CLK(CLK), .ENB(ENB), .RCI(RCI), .MODO(MODO), .A(A[3:0]), .B(B[3:0]), .Q(Q1), .RCO(C1));
sumador4 bloque2 (.CLK(CLK), .ENB(ENB), .RCI(W1), .MODO(MODO), .A(A[7:4]), .B(B[7:4]), .Q(Q2), .RCO(RCO));

// Instances' outputs concatenation
assign Q = {Q2, Q1};

endmodule
