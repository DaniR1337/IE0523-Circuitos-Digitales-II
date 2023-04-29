module atm(CLK, RESET, TARJETA_RECIBIDA, PIN, DIGITO, DIGITO_STB, TIPO_TRANS, MONTO, MONTO_STB, BALANCE_ACTUALIZADO, ENTREGAR_DINERO, FONDOS_INSUFICIENTES, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO);

// Inputs
input  CLK, RESET, TARJETA_RECIBIDA, TIPO_TRANS, DIGITO_STB, MONTO_STB;
input [3:0] DIGITO;
input [15:0] PIN;
input [31:0] MONTO;

// Outputs
output reg ENTREGAR_DINERO, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO, FONDOS_INSUFICIENTES, BALANCE_ACTUALIZADO;

// Registros internos
reg BALANCE;
reg [2:0] ESTADO, PROX_ESTADO, INTENTOS;

// Descripción de Flip FLops
always @(posedge CLK) begin
    if (RESET) begin
        ESTADO <= PROX_ESTADO;
    end else begin
        INTENTOS = 0;
        ESTADO <= 3'b0;
    end
end

// Lógica de próximo estado
always @(*) begin
    PROX_ESTADO = ESTADO;
    case (ESTADO)
        3'b000: begin
                    if (DIGITO_STB & (PIN[3:0] == DIGITO)) PROX_ESTADO = 3'b001;
                    else if (DIGITO_STB & (PIN[3:0] != DIGITO)) begin
                        PROX_ESTADO = 3'b000;
                        INTENTOS = INTENTOS + 1;
                    end else PROX_ESTADO = 3'b000;
                end 
        3'b001: begin
                    if (DIGITO_STB & (PIN[7:4] == DIGITO)) PROX_ESTADO = 3'b011;
                    else if (DIGITO_STB & (PIN[7:4] != DIGITO)) begin
                        PROX_ESTADO = 3'b000;
                        INTENTOS = INTENTOS + 1;
                    end else PROX_ESTADO = 3'b001;
                end 
        3'b011: begin
                    if (DIGITO_STB & (PIN[11:8] == DIGITO)) PROX_ESTADO = 3'b010;
                    else if (DIGITO_STB & (PIN[11:8] != DIGITO)) begin
                        PROX_ESTADO = 3'b000;
                        INTENTOS = INTENTOS + 1;
                    end else PROX_ESTADO = 3'b011;
                end 
        3'b010: begin
                    if (DIGITO_STB & (PIN[15:12] == DIGITO)) PROX_ESTADO = 3'b110;
                    else if (DIGITO_STB & (PIN[15:12] != DIGITO)) begin
                        PROX_ESTADO = 3'b000;
                        INTENTOS = INTENTOS + 1;
                    end else PROX_ESTADO = 3'b010;
                end 
        default: PROX_ESTADO = 3'b000;
    endcase
end


// Seguridad de cajero por cantidad de intentos
always @(INTENTOS) begin
    case (INTENTOS)
        1:  PIN_INCORRECTO = 1;
        2:  ADVERTENCIA = 1;
        3:  BLOQUEO = 1;
    endcase
end



endmodule
