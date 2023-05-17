module SCK(
  input wire CLK,
  input wire CKP,
  input wire CPH,
  input wire ENB,
  output wire SCK
);

  reg [1:0] divider;
  reg sclk = 0;

  always @(posedge CLK) begin
    if (ENB) begin
      divider <= 2'b00;
      sclk <= CKP ^ CPH ? ~sclk : sclk;
    end else if (divider < 2'b11) begin
      divider <= divider + 1;
    end else begin
      divider <= 2'b00;
      sclk <= CKP ^ CPH ? ~sclk : sclk;
    end
  end

  assign SCK = sclk;

endmodule

module SCK_tb;

reg CLK, CKP, CPH, ENB;
wire SCK;

SCK DUT(
  .CLK(CLK),
  .CKP(CKP),
  .CPH(CPH),
  .ENB(ENB),
  .SCK(SCK)
);

initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, SCK_tb);
    ENB = 1;
    CLK = 0;
    CKP = 0;
    CPH = 0;

il

    #100;
    $finish;
end

always #5 CLK = !CLK;

endmodule

