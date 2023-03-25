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
                    output  RCO);

if (ENB) begin
    assign RCO = (A[3] & B[3]);
end

always @(posedge CLK) begin
    if (ENB) begin
        case ({MODO, RCI})
            2'b00?:  Q <= Q ;
            2'b010:  Q <= A + B;
            2'b011:  Q <= A + B + 1'b1;
            2'b10?:  Q <= A - B;
            2'b11?:  Q <= 4'b0;
        endcase
    end
end

endmodule