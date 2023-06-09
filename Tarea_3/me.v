module me(
    input CLK, RESET, TARJETA_RECIBIDA, DIGITO_STB, TIPO_TRANS, MONTO_STB,
    input [15:0] PIN, 
    input [3:0] DIGITO,
    input  [31:0] MONTO,
    output reg BALANCE_ACTUALIZADO, ENTREGAR_DINERO, FONDOS_INSUFICIENTES, ADVERTENCIA, BLOQUEO, PIN_INCORRECTO
);

// Definición de estados
parameter ESPERA                = 4'b0000;
parameter INTRODUCIENDO_PIN_1   = 4'b0001;
parameter INTRODUCIENDO_PIN_2   = 4'b0011;
parameter INTRODUCIENDO_PIN_3   = 4'b0010;
parameter INTRODUCIENDO_PIN_4   = 4'b0110;
parameter TRANS_ELEGIR          = 4'b0100;
parameter TRANS_RETIRO          = 4'b1100;
parameter TRANS_DEPOSITO        = 4'b1000;
parameter PIN_INCORRECTO_1      = 4'b1001;
parameter PIN_INCORRECTO_2      = 4'b1011;
parameter PIN_INCORRECTO_3      = 4'b1010;

// Registros internos
reg [3:0] ESTADO, PROX_ESTADO;
reg [15:0] PIN_INTRODUCIDO;
reg [63:0] BALANCE = 696969; // Puede variar, es la cantidad de dinero en la cuenta
reg ENABLE = 1;

// Descripción de Flip-Flops
always @(posedge CLK) begin
    if (!RESET) begin
        ESTADO <= ESPERA;
        BALANCE_ACTUALIZADO <= 0;
        ENTREGAR_DINERO <= 0;
        FONDOS_INSUFICIENTES <= 0;
        PIN_INCORRECTO <= 0;
        ADVERTENCIA <= 0;
        BLOQUEO <= 0;
        ENABLE <= 1;
    end else begin
        if (ENABLE) begin
            ESTADO <= PROX_ESTADO;    
        end
    end
end


// Lógica de próximo estado
// Se diseñó una maquina de MOORE
always @(*) begin
    case (ESTADO)
        ESPERA: begin
            PROX_ESTADO = (TARJETA_RECIBIDA) ? INTRODUCIENDO_PIN_1 : ESPERA;
            BALANCE_ACTUALIZADO = 0;
            ENTREGAR_DINERO = 0;
            FONDOS_INSUFICIENTES = 0;
            PIN_INCORRECTO = 0;
            ADVERTENCIA = 0;
            BLOQUEO = 0;
        end 

        INTRODUCIENDO_PIN_1: begin
            case ({DIGITO_STB, (PIN[15:12] == DIGITO), PIN_INCORRECTO, ADVERTENCIA})
                4'b1100: PROX_ESTADO = INTRODUCIENDO_PIN_2;
                4'b1110: PROX_ESTADO = INTRODUCIENDO_PIN_2;
                4'b1111: PROX_ESTADO = INTRODUCIENDO_PIN_2;
                4'b1000: PROX_ESTADO = PIN_INCORRECTO_1;
                4'b1010: PROX_ESTADO = PIN_INCORRECTO_2;
                4'b1011: PROX_ESTADO = PIN_INCORRECTO_3;
                default: PROX_ESTADO = INTRODUCIENDO_PIN_1;
            endcase
        end

        INTRODUCIENDO_PIN_2: begin
            case ({DIGITO_STB, (PIN[11:8] == DIGITO), PIN_INCORRECTO, ADVERTENCIA})
                4'b1100: PROX_ESTADO = INTRODUCIENDO_PIN_3;
                4'b1110: PROX_ESTADO = INTRODUCIENDO_PIN_3;
                4'b1111: PROX_ESTADO = INTRODUCIENDO_PIN_3;
                4'b1000: PROX_ESTADO = PIN_INCORRECTO_1;
                4'b1010: PROX_ESTADO = PIN_INCORRECTO_2;
                4'b1011: PROX_ESTADO = PIN_INCORRECTO_3;
                default: PROX_ESTADO = INTRODUCIENDO_PIN_2;
            endcase
        end

        INTRODUCIENDO_PIN_3: begin
            case ({DIGITO_STB, (PIN[7:4] == DIGITO), PIN_INCORRECTO, ADVERTENCIA})
                4'b1100: PROX_ESTADO = INTRODUCIENDO_PIN_4;
                4'b1110: PROX_ESTADO = INTRODUCIENDO_PIN_4;
                4'b1111: PROX_ESTADO = INTRODUCIENDO_PIN_4;
                4'b1000: PROX_ESTADO = PIN_INCORRECTO_1;
                4'b1010: PROX_ESTADO = PIN_INCORRECTO_2;
                4'b1011: PROX_ESTADO = PIN_INCORRECTO_3;
                default: PROX_ESTADO = INTRODUCIENDO_PIN_3;
            endcase
        end

        INTRODUCIENDO_PIN_4: begin
            case ({DIGITO_STB, (PIN[3:0] == DIGITO), PIN_INCORRECTO, ADVERTENCIA})
                4'b1100: PROX_ESTADO = TRANS_ELEGIR;
                4'b1110: PROX_ESTADO = TRANS_ELEGIR;
                4'b1111: PROX_ESTADO = TRANS_ELEGIR;
                4'b1000: PROX_ESTADO = PIN_INCORRECTO_1;
                4'b1010: PROX_ESTADO = PIN_INCORRECTO_2;
                4'b1011: PROX_ESTADO = PIN_INCORRECTO_3;
                default: PROX_ESTADO = INTRODUCIENDO_PIN_4;
            endcase
        end

        TRANS_ELEGIR: begin
            case (TIPO_TRANS)
                2'b0: PROX_ESTADO = TRANS_DEPOSITO; // Depósito
                2'b1: PROX_ESTADO = TRANS_RETIRO; // Retiro
                default: PROX_ESTADO = TRANS_ELEGIR;
            endcase
        end

        PIN_INCORRECTO_1: PROX_ESTADO = INTRODUCIENDO_PIN_1;

        PIN_INCORRECTO_2: PROX_ESTADO = INTRODUCIENDO_PIN_1;

        PIN_INCORRECTO_3: begin
            PROX_ESTADO = ESPERA;
            ENABLE = 0;
        end 

    endcase
end

// Retiro e introducción de tarjeta
always @(negedge TARJETA_RECIBIDA) begin
    PROX_ESTADO = ESPERA;
end


// Salidas de MOORE por seguridad
always @(ESTADO) begin
    case (ESTADO)
        PIN_INCORRECTO_1:   PIN_INCORRECTO = 1;
        PIN_INCORRECTO_2:   ADVERTENCIA = 1;
        PIN_INCORRECTO_3:   BLOQUEO = 1; 
    endcase
end

// Salidas de MOORE por transacciones
always @(posedge MONTO_STB) begin
    case ({ESTADO, (BALANCE>MONTO)})
        5'b10001: begin
            BALANCE = BALANCE + MONTO;
            BALANCE_ACTUALIZADO = 1;
            FONDOS_INSUFICIENTES = 0;
        end 
        5'b11001: begin
            BALANCE = BALANCE - MONTO;
            BALANCE_ACTUALIZADO = 1;
            FONDOS_INSUFICIENTES = 0;
            ENTREGAR_DINERO = 1;
        end 
        5'b10000: begin
            BALANCE = BALANCE + MONTO;
            BALANCE_ACTUALIZADO = 1;
            FONDOS_INSUFICIENTES = 0;
        end 
        5'b11000: FONDOS_INSUFICIENTES = 1;
    endcase
end

endmodule
