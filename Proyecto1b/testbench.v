//------------------------------//
// Proyecto 1b                  //
// Capacitación VLSI            //
// Daniel Rodríguez Alvarado    //
//------------------------------//

`include "ME.v"

module ME_tb();

// Inputs
reg CLK, RESET, DIGITO_STB, SOLICITUD_ACCESO;
reg [3:0] DIGITO;

// Outputs
wire ACCESO_ACEPTADO, ACCESO_DENEGADO;

ME DUT(
    .CLK(CLK),
    .RESET(RESET),
    .DIGITO_STB(DIGITO_STB),
    .SOLICITUD_ACCESO(SOLICITUD_ACCESO),
    .DIGITO(DIGITO),
    .ACCESO_ACEPTADO(ACCESO_ACEPTADO),
    .ACCESO_DENEGADO(ACCESO_DENEGADO)
);

initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, DUT);

    DIGITO_STB = 0;
    CLK = 0;
    RESET = 0;
    DIGITO = 0;
    SOLICITUD_ACCESO = 1;

    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #5;
    #5;
    //DIGITO_STB = 0;

    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    #10;
    DIGITO = 9;
    #20;
    DIGITO = 6;
    #20;
    DIGITO = 9;
    #50;

    

    // INICIA LA OBTENCIÓN DEL PIN INCORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 3;
    #10;
    SOLICITUD_ACCESO = 0;
    #10;
    DIGITO = 9;
    #10;
    #10;
    DIGITO = 6;
    #10;
    #10;
    DIGITO = 9;
    #50;


    // INICIA LA OBTENCIÓN DEL PIN INCORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    #10;
    DIGITO = 3;
    #10;
    #10;
    DIGITO = 6;
    #10;
    #10;
    DIGITO = 9;
    #50;

    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    #10;
    DIGITO = 9;
    #10;
    #10;
    DIGITO = 6;
    #10;
    #10;
    DIGITO = 9;
    #50;

    // INICIA LA OBTENCIÓN DEL PIN INCORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    #10;
    DIGITO = 9;
    RESET = 1;
    #10;
    RESET = 0;
    #10;
    DIGITO = 6;
    #10;
    #10;
    DIGITO = 3;
    #55;


    #100;
    $finish;
end

always #5 CLK = !CLK;
always #10 DIGITO_STB = !DIGITO_STB;

endmodule