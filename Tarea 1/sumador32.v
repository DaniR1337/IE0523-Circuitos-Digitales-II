`include "sumador4.v"

module sumador8 (   input   CLK,
                    input   ENB,
                    input   RCI,
                    input   [1:0] MODO,
                    input   [31:0] A,
                    input   [31:0] B,
                    output  reg [31:0] Q,
                    output  RCO);

// Wires para los carreos y para las salidas
wire C1, C2, C3, C4, C5, C6, C7;
wire [3:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9;

// Instancias de módulo sumador4
sumador4 bloque1 (.CLK(CLK), .ENB(ENB), .RCI(RCI), .MODO(MODO), .A(A[3:0]), .B(B[3:0]), .Q(Q1[3:0]), .RCO(C1));
sumador4 bloque2 (.CLK(CLK), .ENB(ENB), .RCI(C1), .MODO(MODO), .A(A[7:4]), .B(B[7:4]), .Q(Q2[3:0]), .RCO(C2));
sumador4 bloque3 (.CLK(CLK), .ENB(ENB), .RCI(C2), .MODO(MODO), .A(A[11:8]), .B(B[11:8]), .Q(Q3[3:0]), .RCO(C3));
sumador4 bloque4 (.CLK(CLK), .ENB(ENB), .RCI(C3), .MODO(MODO), .A(A[15:12]), .B(B[15:12]), .Q(Q4[3:0]), .RCO(C4));
sumador4 bloque5 (.CLK(CLK), .ENB(ENB), .RCI(C4), .MODO(MODO), .A(A[19:16]), .B(B[19:16]), .Q(Q5[3:0]), .RCO(C5));
sumador4 bloque6 (.CLK(CLK), .ENB(ENB), .RCI(C5), .MODO(MODO), .A(A[23:20]), .B(B[23:20]), .Q(Q6[3:0]), .RCO(C6));
sumador4 bloque7 (.CLK(CLK), .ENB(ENB), .RCI(C6), .MODO(MODO), .A(A[27:24]), .B(B[27:24]), .Q(Q7[3:0]), .RCO(C7));
sumador4 bloque8 (.CLK(CLK), .ENB(ENB), .RCI(C7), .MODO(MODO), .A(A[31:28]), .B(B[31:28]), .Q(Q8[3:0]), .RCO(RCO));

// Se concatenan los resultados de ambos sumadores
always @* 
    Q = {Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1}; 

endmodule








