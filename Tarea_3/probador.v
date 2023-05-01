module probador(
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

    output CLK, RESET, TARJETA_RECIBIDA, TIPO_TRANS, DIGITO_STB, MONTO_STB;
    output [3:0] DIGITO;
    output [15:0] PIN;
    output [31:0] MONTO;
    input ENTREGAR_DINERO, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO, FONDOS_INSUFICIENTES, BALANCE_ACTUALIZADO;

    // Inputs
    reg  CLK, RESET, TARJETA_RECIBIDA, TIPO_TRANS, DIGITO_STB, MONTO_STB;
    reg [3:0] DIGITO;
    reg [15:0] PIN;
    reg [31:0] MONTO;

    // Outputs
    wire ENTREGAR_DINERO, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO, FONDOS_INSUFICIENTES, BALANCE_ACTUALIZADO;

    // Initialize the inputs
    initial begin
        TARJETA_RECIBIDA = 0;
        MONTO_STB = 0;
        CLK = 0;
        RESET = 0;
        #5;
        
        #5;
        RESET = 1;
        TARJETA_RECIBIDA = 1;
        #10;
        PIN = 16'h6575;
        #10;
        DIGITO_STB = 1;
        DIGITO = 6;
        #10;
        DIGITO_STB = 1;
        DIGITO = 5;
        #10;
        DIGITO_STB = 1;
        DIGITO = 3;
        #10;
        DIGITO_STB = 1;
        DIGITO = 5;
        
        
        #10;
        DIGITO_STB = 1;
        DIGITO = 6;
        #10;
        DIGITO_STB = 1;
        DIGITO = 5;
        #10;
        DIGITO_STB = 1;
        DIGITO = 7;
        #10;
        DIGITO_STB = 1;
        DIGITO = 5;
        #10;
        TIPO_TRANS = 0;
        MONTO = 272727;
        MONTO_STB = 1;
        #10
        MONTO_STB = 0;
        #100
        $finish;

    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;
    
endmodule