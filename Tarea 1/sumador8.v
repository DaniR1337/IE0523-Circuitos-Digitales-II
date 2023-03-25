`include "sumador4.v"

module sumador8 (   input   CLK,
                    input   ENB,
                    input   RCI,
                    input   [1:0] MODO,
                    input   [7:0] A,
                    input   [7:0] B,
                    output  reg [7:0] Q,
                    output  RCO);

// Wires para el carreo (del bloque 1 a bloque 2) y para las salidas
wire C1;
wire [3:0] Q1, Q2;

// Instancias de módulo sumador4
sumador4 bloque1 (.CLK(CLK), .ENB(ENB), .RCI(RCI), .MODO(MODO), .A(A[3:0]), .B(B[3:0]), .Q(Q1[3:0]), .RCO(C1));
sumador4 bloque2 (.CLK(CLK), .ENB(ENB), .RCI(C1), .MODO(MODO), .A(A[7:4]), .B(B[7:4]), .Q(Q2[7:4]), .RCO(RCO));

// Se concatenan los resultados de ambos sumadores
assign Q = {Q2, Q1}; 

endmodule
