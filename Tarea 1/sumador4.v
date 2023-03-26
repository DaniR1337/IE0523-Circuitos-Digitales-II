/*
Sumador binario sincrónico de 4 bits, con los siguientes modos de funcionamiento:
a) Suma
b) Resta
c) Mantener valor anterior
d) Limpiar el sumador
*/

module sumador4 (   input   CLK,
                    input   ENB,
                    input   RCI,
                    input   [1:0] MODO,
                    input   [3:0] A,
                    input   [3:0] B,
                    output  reg [3:0] Q,
                    output  reg RCO);

wire [3:0] negB;
assign compB = ~B + 1'b1;


always @(posedge CLK) begin
    if (ENB) begin
        case ({MODO, RCI})
            3'b00x: Q <= Q ;
            3'b010: begin
                        Q <= A + B;
                        RCO = (A[3] & B[3]);
                    end
            3'b011: Q <= A + B + 1'b1;
            3'b10x: begin
                        Q <= A + negB;
                        RCO = (A[3] & negB[3]);
                    end
            3'b11x: Q <= 4'b0;
        endcase
    end
end

endmodule