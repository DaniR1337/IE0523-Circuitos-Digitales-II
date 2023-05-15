module TX(  input   CPK, CPH, CLK, RESET, MISO,
            output  SCK, CS, MOSI);


// Registro contador
reg [1:0] CONTADOR = 2'b01;

// Generación del SCK
always @(posedge CLK) begin
    if (CONTADOR == 2'b11) begin
        CONTADOR <= 2'b00;
    end else begin
        CONTADOR <= CONTADOR + 1;
    end
end

assign SCK = CONTADOR[1];


endmodule

module testi;

wire SCK, CS, MOSI;
reg CPK, CPH, CLK, RESET, MISO;

initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, testi);
    CLK = 0;
    #100;
    $finish;
end

always #5 CLK = !CLK;

TX DUT(
  .CPK(CPK),
  .CPH(CPH),
  .CLK(CLK),
  .RESET(RESET),
  .MISO(MISO),
  .SCK(SCK),
  .CS(CS),
  .MOSI(MOSI)
);

endmodule