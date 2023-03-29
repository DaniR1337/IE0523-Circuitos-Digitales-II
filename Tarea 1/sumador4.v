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
assign negB = ~B + 1'b1;


always @(posedge CLK) begin
    if (ENB) begin
        case ({MODO, RCI})
            3'b00x: Q <= Q ;
            3'b010: begin
                        {RCO, Q} <= A + B;
                    end
            3'b011: {RCO, Q} <= A + B + 1'b1;
            3'b100: begin
                        {RCO, Q} <= A + ~B + 1'b1;
                    end
            //3'b101: {RCO, Q} <= A + ~B + 2'b10;
            3'b101: {RCO, Q} <= 5'b11111;
            3'b110: Q <= 4'b0;
        endcase
    end
end

endmodule