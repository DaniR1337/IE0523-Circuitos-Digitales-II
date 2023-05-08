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

    CLK = 0;
    RESET = 0;
    DIGITO = 0;
    SOLICITUD_ACCESO = 1;

    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #10;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    DIGITO = 9;
    #10;
    DIGITO = 6;
    #10;
    DIGITO = 9;
    #10;
    #50;

    

    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 3;
    #10;
    SOLICITUD_ACCESO = 0;
    DIGITO = 9;
    #10;
    DIGITO = 6;
    #10;
    DIGITO = 9;
    #10;
    #50;


    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    DIGITO = 3;
    #10;
    DIGITO = 6;
    #10;
    DIGITO = 9;
    #10;
    #50;

    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    DIGITO = 9;
    #10;
    DIGITO = 3;
    #10;
    DIGITO = 9;
    #10;
    #50;

    // INICIA LA OBTENCIÓN DEL PIN CORRECTO
    #10;
    SOLICITUD_ACCESO = 1;
    DIGITO = 6;
    #10;
    SOLICITUD_ACCESO = 0;
    DIGITO = 9;
    #10;
    DIGITO = 6;
    #10;
    DIGITO = 3;
    #10;
    #50;

    #100;
    $finish;
end

always #5 CLK = !CLK;

endmodule