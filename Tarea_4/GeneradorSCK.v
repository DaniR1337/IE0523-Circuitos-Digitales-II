module GeneradorSCK (
  input wire CLK,   // Reloj principal
  input wire CKP,   // Polaridad del reloj cuando ENB = 0
  input wire CPH,   // Polaridad del primer flanco del reloj cuando ENB = 1
  input wire ENB,   // Habilitador del generador SCK
  output reg SCK    // Salida del generador SCK
);
  reg previous_ENB;
  reg previous_CLK;

  always @(posedge CLK) begin
    previous_ENB <= ENB;
    previous_CLK <= CLK;
    if (ENB) begin
      if (CPH) begin
        SCK <= ~previous_CLK;
      end else begin
        SCK <= previous_CLK;
      end
    end else begin
      if (CKP) begin
        SCK <= 1'b1;
      end else begin
        SCK <= 1'b0;
      end
    end
  end
endmodule
