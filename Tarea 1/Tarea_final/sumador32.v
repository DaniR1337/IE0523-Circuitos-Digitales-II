/*
Synchronous 32-bit binary adder, with the following modes of operation:
a) Addition
b) Subtraction
c) Hold previous value
d) Clear the adder
*/

`include "sumador4.v"

module sumador32 (  input   CLK,
                    input   ENB,
                    input   RCI,
                    input   [1:0] MODO,
                    input   [31:0] A,
                    input   [31:0] B,
                    output  reg [31:0] Q,
                    output  RCO);

// Wires for carries and instance outputs
wire C1, C2, C3, C4, C5, C6, C7;
wire [3:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8;

// Code for anticipation of carry outs
// Same strategy was used for 8-bit adder
reg W1, W2, W3, W4, W5, W6, W7, W8;
reg [3:0] W;
always @(A or B) begin
    if (MODO == 2'b01) begin
        {W1, W} = A[3:0] + B[3:0] + RCI;
        {W2, W} = A[7:4] + B[7:4] + W1; 
        {W3, W} = A[11:8] + B[11:8] + W2;
        {W4, W} = A[15:12] + B[15:12] + W3;
        {W5, W} = A[19:16] + B[19:16] + W4;
        {W6, W} = A[23:20] + B[23:20] + W5;
        {W7, W} = A[27:24] + B[27:24] + W6;
    end
    if (MODO == 2'b10) begin
        {W1, W} = A[3:0] - B[3:0];
        {W2, W} = A[7:4] - B[7:4] + {W1, 4'b0}; 
        {W3, W} = A[11:8] - B[11:8] + {W2, 4'b0};
        {W4, W} = A[15:12] - B[15:12] + {W3, 4'b0};
        {W5, W} = A[19:16] - B[19:16] + {W4, 4'b0};
        {W6, W} = A[23:20] - B[23:20] + {W5, 4'b0};
        {W7, W} = A[27:24] - B[27:24] + {W6, 4'b0};
    end
    if (MODO == 2'b11 & RCI == 0) begin
        {W1, W2, W3, W4, W5, W6, W7, W8} = 0;
    end
end

// sumador4 instances
sumador4 bloque1 (.CLK(CLK), .ENB(ENB), .RCI(RCI), .MODO(MODO), .A(A[3:0]), .B(B[3:0]), .Q(Q1), .RCO(C1));
sumador4 bloque2 (.CLK(CLK), .ENB(ENB), .RCI(W1), .MODO(MODO), .A(A[7:4]), .B(B[7:4]), .Q(Q2), .RCO(C2));
sumador4 bloque3 (.CLK(CLK), .ENB(ENB), .RCI(W2), .MODO(MODO), .A(A[11:8]), .B(B[11:8]), .Q(Q3), .RCO(C3));
sumador4 bloque4 (.CLK(CLK), .ENB(ENB), .RCI(W3), .MODO(MODO), .A(A[15:12]), .B(B[15:12]), .Q(Q4), .RCO(C4));
sumador4 bloque5 (.CLK(CLK), .ENB(ENB), .RCI(W4), .MODO(MODO), .A(A[19:16]), .B(B[19:16]), .Q(Q5), .RCO(C5));
sumador4 bloque6 (.CLK(CLK), .ENB(ENB), .RCI(W5), .MODO(MODO), .A(A[23:20]), .B(B[23:20]), .Q(Q6), .RCO(C6));
sumador4 bloque7 (.CLK(CLK), .ENB(ENB), .RCI(W6), .MODO(MODO), .A(A[27:24]), .B(B[27:24]), .Q(Q7), .RCO(C7));
sumador4 bloque8 (.CLK(CLK), .ENB(ENB), .RCI(W7), .MODO(MODO), .A(A[31:28]), .B(B[31:28]), .Q(Q8), .RCO(RCO));


// Instances' outputs concatenation
always @* 
    Q = {Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1}; 

endmodule








