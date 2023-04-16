/*
Synchronous 4-bit binary adder, with the following modes of operation:
a) Addition
b) Subtraction
c) Hold previous value
d) Clear the adder
*/

module sumador4 (   input   CLK,
                    input   ENB,
                    input   RCI,
                    input   [1:0] MODO,
                    input   [3:0] A,
                    input   [3:0] B,
                    output  reg [3:0] Q,
                    output  reg RCO);

// Every positive edge of the clock signal will generate an output based on the selected MODO signal AND the carry-in signal
// Case instruction was used for this purpose
always @(posedge CLK) begin
    if (ENB) begin
        case ({MODO, RCI})
            3'b00x: Q <= Q ;
            3'b010: begin
                        {RCO, Q} <= A + B;
                    end
            3'b011: {RCO, Q} <= A + B + 1'b1;
            3'b100: begin
                        {RCO, Q} <= A - B;
                    end
            // When subtracting and RCI is 1, propagate base-2 
            3'b101: {RCO, Q} <= 5'b11111;
            3'b110: Q <= 4'b0;
            3'b111: Q <= 4'b0;
        endcase
    end
end

endmodule