module probador(
    ENB,
    CLK,
    RESET,
    TARJETA_RECIBIDA,
    PIN,
    DIGITO,
    DIGITO_STB,
    TIPO_TRANS,
    MONTO,
    MONTO_STB,
    BALANCE_ACTUALIZADO,
    ENTREGAR_DINERO,
    FONDOS_INSUFICIENTES,
    PIN_INCORRECTO,
    ADVERTENCIA,
    BLOQUEO
);

    output CLK, RESET, TARJETA_RECIBIDA, TIPO_TRANS, DIGITO_STB, MONTO_STB, ENB;
    output [3:0] DIGITO;
    output [15:0] PIN;
    output [31:0] MONTO;
    input ENTREGAR_DINERO, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO, FONDOS_INSUFICIENTES, BALANCE_ACTUALIZADO;

    // Inputs
    reg  CLK, RESET, TARJETA_RECIBIDA, TIPO_TRANS, DIGITO_STB, MONTO_STB, ENB;
    reg [3:0] DIGITO;
    reg [15:0] PIN;
    reg [31:0] MONTO;

    // Outputs
    wire ENTREGAR_DINERO, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO, FONDOS_INSUFICIENTES, BALANCE_ACTUALIZADO;

    // Initialize the inputs
    initial begin

        // VALORES INICIALES E INTRODUCCIÓN DE TARJETA
        ENB = 1;
        TARJETA_RECIBIDA = 0;
        MONTO_STB = 0;
        CLK = 0;
        RESET = 0;
        DIGITO_STB = 0;
        #10;
        RESET = 1;
        TARJETA_RECIBIDA = 1;

        // INICIA LA OBTENCIÓN DEL PIN CORRECTO
        #10;
        PIN = 16'h6575;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 7;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 0;
        #10;

        // ETAPA DE TRANSACCIÓN: RETIRO
        TIPO_TRANS = 1;
        #10;
        MONTO = 99999999; //MONTO = 272727;
        #10;
        MONTO_STB = 1;
        #10;
        MONTO_STB = 0;
        MONTO = 272727; 
        #10;
        MONTO_STB = 1;
        #10;
        MONTO_STB = 0;

        // RETIRO DE TARJETA
        TARJETA_RECIBIDA = 0;
        #50

        // VALORES INICIALES (NUEVAMENTE) E INTRODUCCIÓN DE TARJETA
        TIPO_TRANS = 0;
        TARJETA_RECIBIDA = 0;
        MONTO_STB = 0;
        DIGITO_STB = 0;
        #10;
        TARJETA_RECIBIDA = 1;

        // INICIA LA OBTENCIÓN DEL PIN CORRECTO
        #10;
        PIN = 16'h6575;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 7;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 0;
        #10;

        // ETAPA DE TRANSACCION: DEPÓSITO
        TIPO_TRANS = 0;
        #10;
        MONTO = 272727; 
        #10;
        MONTO_STB = 1;
        #10;
        MONTO_STB = 0;

        // RETIRO DE TARJETA
        TARJETA_RECIBIDA = 0;
        #50;

        // INTRODUCCIÓN DE TARJETA
        TARJETA_RECIBIDA = 1;
        #10;

        // INTRO DE PIN INCORRECTO PARA LEVANTAR ADVERTENCIAS
        #10;
        PIN = 16'h6575;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 7;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 4;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 8;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 7;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 0;
        DIGITO_STB = 1;
        #10;
        DIGITO = 0;
        #10;

        // INGRESO DE ENTRADAS PARA DEMOSTRAR QUE LA MAQUINA PERMANECE BLOQUEADA
        #10;
        PIN = 16'h6575;
        #10;
        DIGITO_STB = 0;
        MONTO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        MONTO_STB = 1;
        #10;
        DIGITO_STB = 0;
        MONTO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        MONTO_STB = 1;
        #10;
        DIGITO_STB = 0;
        MONTO_STB = 0;
        #10;
        DIGITO = 7;
        DIGITO_STB = 1;
        MONTO_STB = 1;
        #10;
        DIGITO_STB = 0;
        MONTO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        MONTO_STB = 1;
        #10;
        DIGITO_STB = 0;
        MONTO_STB = 0;
        #10;
        DIGITO = 0;
        #10;

        // SE DESBLOQUEA LA MAQUINA CON UN RESET
        #50;
        RESET = 0;
        #10; 
        RESET = 1;

        // NORMAL CONTINUAMIENTO PARA DEMOSTRAR QUE SE DESBLOQUEÓ
        #10;
        PIN = 16'h6575;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 6;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 7;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 5;
        DIGITO_STB = 1;
        #10;
        DIGITO_STB = 0;
        #10;
        DIGITO = 0;
        #10;




        #100;
        $finish;
    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;
    
endmodule