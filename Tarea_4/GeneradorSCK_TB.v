`include "GeneradorSCK.v"
module GeneradorSCK_TB;
  reg CLK;
  reg CKP;
  reg CPH;
  reg ENB;
  wire SCK;

  GeneradorSCK uut (
    .CLK(CLK),
    .CKP(CKP),
    .CPH(CPH),
    .ENB(ENB),
    .SCK(SCK)
  );

  initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, GeneradorSCK_TB);
    // Inicializar las entradas
    CLK = 0;
    CKP = 0;
    CPH = 0;
    ENB = 0;

    // Esperar un ciclo antes de habilitar ENB
    #1 ENB = 1;

    // Cambiar las entradas para probar diferentes configuraciones
    #10 CKP = 1;
    #10 CPH = 1;
    #10 ENB = 0;
    #10 ENB = 1;
    #10 CKP = 0;
    #10 CPH = 0;
    #10 ENB = 0;
    #10 $finish;
  end

  always begin
    #5 CLK = ~CLK; // Invertir el reloj cada 5 unidades de tiempo
  end

endmodule
