`timescale 1ns/1ns
`include "atm.v"
`include "probador.v"

module testbench;

    // Inputs
    wire CLK, RESET, TARJETA_RECIBIDA, DIGITO_STB, TIPO_TRANS, MONTO_STB;
    wire [15:0] PIN;
    wire [3:0] DIGITO;
    wire [31:0] MONTO;

    // Outputs
    wire ENTREGAR_DINERO, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO, FONDOS_INSUFICIENTES, BALANCE_ACTUALIZADO;

    initial begin
        $dumpfile("resultados.vcd");
        $dumpvars(-1, testbench);
    end

    // Instantiate the design under test as well as the tester
    atm U0 (
        .CLK(CLK),
        .RESET(RESET),
        .TARJETA_RECIBIDA(TARJETA_RECIBIDA),
        .PIN(PIN),
        .DIGITO(DIGITO),
        .DIGITO_STB(DIGITO_STB),
        .TIPO_TRANS(TIPO_TRANS),
        .MONTO(MONTO),
        .MONTO_STB(MONTO_STB),
        .BALANCE_ACTUALIZADO(BALANCE_ACTUALIZADO),
        .ENTREGAR_DINERO(ENTREGAR_DINERO),
        .FONDOS_INSUFICIENTES(FONDOS_INSUFICIENTES),
        .PIN_INCORRECTO(PIN_INCORRECTO),
        .ADVERTENCIA(ADVERTENCIA),
        .BLOQUEO(BLOQUEO)
    );
    probador P0 (
        .CLK(CLK),
        .RESET(RESET),
        .TARJETA_RECIBIDA(TARJETA_RECIBIDA),
        .PIN(PIN),
        .DIGITO(DIGITO),
        .DIGITO_STB(DIGITO_STB),
        .TIPO_TRANS(TIPO_TRANS),
        .MONTO(MONTO),
        .MONTO_STB(MONTO_STB),
        .BALANCE_ACTUALIZADO(BALANCE_ACTUALIZADO),
        .ENTREGAR_DINERO(ENTREGAR_DINERO),
        .FONDOS_INSUFICIENTES(FONDOS_INSUFICIENTES),
        .PIN_INCORRECTO(PIN_INCORRECTO),
        .ADVERTENCIA(ADVERTENCIA),
        .BLOQUEO(BLOQUEO)
    );

endmodule