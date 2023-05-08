//-------------------------------------------------//
// Quiz #4, Daniel Rodríguez Alvarado, C06575      //
//-------------------------------------------------//

module me(
    input ARRANQUE, MODO, REINICIO, CLK,
    output reg MOTOR1, MOTOR2
);

// Declaración de estados
parameter INICIO    = 4'b0001;
parameter GAS       = 4'b0010;
parameter ELECTRICO = 4'b0100;
parameter FIN       = 4'b1000;

// Declaración de registros internos
reg [3:0] ESTADO, PROX_ESTADO;
reg [31:0] BATERIA = 0;
reg [31:0] TANQUE = 0;

// Descripción de Flip-Flops
always @(posedge CLK) begin
    if (REINICIO) begin
        ESTADO <= INICIO;
        BATERIA <= 0;
        TANQUE <= 0;
    end else begin
        ESTADO <= PROX_ESTADO;
    end
end

// Lógica de próximo estado
always @(*) begin
    case (ESTADO)
        INICIO: begin
            case ({ARRANQUE, MODO})
                2'b11:      PROX_ESTADO = GAS;
                2'b10:      PROX_ESTADO = ELECTRICO;
                default:    PROX_ESTADO = INICIO;
            endcase
        end
        GAS:        PROX_ESTADO = (TANQUE == 15) ? FIN : GAS;
        ELECTRICO:  PROX_ESTADO = (BATERIA == 20) ? FIN : ELECTRICO;
        FIN:        PROX_ESTADO = FIN;
    endcase
end

// Lógica de salidas
always @(ESTADO) begin
    case (ESTADO)
        INICIO: begin
            MOTOR1 = 0;
            MOTOR2 = 0;
        end
        GAS: begin
            MOTOR1 = 0;
            MOTOR2 = 1;
            TANQUE = TANQUE + 1;
        end
        ELECTRICO: begin
            MOTOR1 = 1;
            MOTOR2 = 0;
            BATERIA = BATERIA + 1;
        end
        FIN: begin
            MOTOR1 = 1;
            MOTOR2 = 1;
        end
    endcase
end
endmodule
