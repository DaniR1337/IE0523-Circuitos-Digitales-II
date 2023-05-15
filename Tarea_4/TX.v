module TX(  input   CPK, CPH, CLK, RESET, MISO,
            output  SCK, CS, MOSI);


// Registro contador
reg [1:0] CONTADOR;

// Generación del SCK
always @(posedge CLK) begin
    if (CONTADOR == 2'b11) begin
        CONTADOR <= 2'b00:
    end else begin
        CONTADOR <= CONTADOR + 1;
    end
end

assign SCK = &CONTADOR;


endmodule