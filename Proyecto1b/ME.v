//------------------------------//
// Proyecto 1b                  //
// Capacitación VLSI            //
// Daniel Rodríguez Alvarado    //
//------------------------------//

module ME(
    input CLK, RESET, DIGITO_STB, SOLICITUD_ACCESO, 
    input [3:0] DIGITO,
    output reg ACCESO_ACEPTADO, ACCESO_DENEGADO
);

// Declaración de estados
parameter ESPERA                = 5'b00001;
parameter INTRODUCIENDO_PIN_1   = 5'b00010;
parameter INTRODUCIENDO_PIN_2   = 5'b00100;
parameter INTRODUCIENDO_PIN_3   = 5'b01000;
parameter INTRODUCIENDO_PIN_4   = 5'b10000;

// Registros internos
reg [5:0] ESTADO, PROX_ESTADO;
reg [15:0] CLAVE = 16'h6969;
reg [15:0] CLAVE_INTRODUCIDA = 0;

// Descripción de Flip-Flops
always @(posedge CLK) begin
    if (RESET) begin
        ESTADO <= ESPERA;
        ACCESO_ACEPTADO <= 0;
        ACCESO_DENEGADO <= 0;
    end else begin
        ESTADO <= PROX_ESTADO;    
    end
end

// Lógica de próximo estado
always @(*) begin
    case (ESTADO)
        ESPERA: PROX_ESTADO = (SOLICITUD_ACCESO) ? INTRODUCIENDO_PIN_1 : ESPERA;
        INTRODUCIENDO_PIN_1: PROX_ESTADO = (DIGITO_STB) ? INTRODUCIENDO_PIN_2   : INTRODUCIENDO_PIN_1;
        INTRODUCIENDO_PIN_2: PROX_ESTADO = (DIGITO_STB) ? INTRODUCIENDO_PIN_3   : INTRODUCIENDO_PIN_2;
        INTRODUCIENDO_PIN_3: PROX_ESTADO = (DIGITO_STB) ? INTRODUCIENDO_PIN_4   : INTRODUCIENDO_PIN_3;
        INTRODUCIENDO_PIN_4: PROX_ESTADO = (DIGITO_STB) ? ESPERA                : INTRODUCIENDO_PIN_4;
        default: PROX_ESTADO = ESPERA;
    endcase
end

// Lógica de salidas
always @(ESTADO) begin
    case (ESTADO)
        ESPERA: {ACCESO_ACEPTADO, ACCESO_DENEGADO} = 2'b00;
        INTRODUCIENDO_PIN_1: CLAVE_INTRODUCIDA[15:12] = DIGITO;
        INTRODUCIENDO_PIN_2: CLAVE_INTRODUCIDA[11:8] = DIGITO;
        INTRODUCIENDO_PIN_3: CLAVE_INTRODUCIDA[7:4] = DIGITO;
        INTRODUCIENDO_PIN_4: begin
            CLAVE_INTRODUCIDA[3:0] = DIGITO;
            if (CLAVE_INTRODUCIDA == CLAVE) begin
                ACCESO_ACEPTADO = 1;
                ACCESO_DENEGADO = 0;
            end else begin
                ACCESO_ACEPTADO = 0;
                ACCESO_DENEGADO = 1;
            end
        end 
    endcase
end

endmodule
