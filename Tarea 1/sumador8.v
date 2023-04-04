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


// Este always solo es para calcular el RCO inmediato
// Modo 1 es suma, modo 2 es resta. 
always @(A or B) begin
    if (MODO == 2'b01) begin
        // Wires para el carreo (del bloque 1 a bloque 2) y para las salidas
        {W1, W2} = A[3:0] + B[3:0];
    end

    if (MODO == 2'b10) begin
        {W1, W2} = A[3:0] - B[3:0];
    end
end

// Instancias de módulo sumador4
sumador4 bloque1 (.CLK(CLK), .ENB(ENB), .RCI(RCI), .MODO(MODO), .A(A[3:0]), .B(B[3:0]), .Q(Q1), .RCO(C1));
sumador4 bloque2 (.CLK(CLK), .ENB(ENB), .RCI(W1), .MODO(MODO), .A(A[7:4]), .B(B[7:4]), .Q(Q2), .RCO(RCO));

// Se concatenan los resultados de ambos sumadores
assign Q = {Q2, Q1};

endmodule
