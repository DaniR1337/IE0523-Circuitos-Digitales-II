module TX(  input   CKP, CPH, CLK, RESET, MISO, ENB,
            output  SCK, CS, MOSI);


// Registros internos
reg [1:0]   CONTADOR = 2'b00;
reg [7:0]   REGISTRO = 8'h65;
/*
reg [2:0]   ESTADO;  
reg [2:0]   PROX_ESTADO;  
*/
assign CS = !ENB; // Un controlador se encargaría de CS

// Generación del SCK
always @(posedge CLK) begin
    if (ENB) begin
        if (CONTADOR == 2'b11) begin
            CONTADOR <= 2'b00;
        end else begin
            CONTADOR <= CONTADOR + 1;
        end
    end
end

assign SCK = (!CS) ? CONTADOR[1] : ((CKP) ? 1'b1 : 1'b0);

always @(*) begin
    if (!ENB) begin
        case ({CKP, CPH})
            2'b00: ;
            2'b01: ;
            2'b10: ;
            2'b11: ;
        endcase
    end    
end



endmodule

module testi;

wire SCK, CS, MOSI;
reg CKP, CPH, CLK, RESET, MISO, ENB;

initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, testi);
    CLK = 0;
    CKP = 0;
    ENB = 0;
    #50;
    ENB = 1;
    #100;
    $finish;
end

always #5 CLK = !CLK;

TX DUT(
  .CKP(CKP),
  .ENB(ENB),
  .CPH(CPH),
  .CLK(CLK),
  .RESET(RESET),
  .MISO(MISO),
  .SCK(SCK),
  .CS(CS),
  .MOSI(MOSI)
);

endmodule