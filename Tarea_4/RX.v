module RX(  input   CKP, CPH, SCK, SS, MOSI,
            output  MISO);

// Registros internos
reg [1:0]   CONTADOR;
reg [13:0]  REGISTRO;
reg [7:0]   BYTE_OUT;
reg [7:0]   BYTE_IN;
reg [2:0]   ESTADO;  
reg [2:0]   PROX_ESTADO;  

// Declaración de estados
parameter ESPERA    = 4'b0001;
parameter SET_SS    = 4'b0010;
parameter OPERACION = 4'b0100;
parameter FINAL     = 4'b1000;

// Descripción de Flip-Flops
always @(posedge SCK) begin
    if (!RESET) begin
        ESTADO <= ESPERA;
    end else begin
        ESTADO <= PROX_ESTADO;    
    end
end

// Lógica de próximo estado
always @(*) begin
    case (ESTADO)
        ESPERA:     PROX_ESTADO = (!SS) ? OPERACION : ESPERA;
        OPERACION:  PROX_ESTADO = (!SS) ? OPERACION : FINAL;
        FINAL:      PROX_ESTADO = ESPERA;
        default:    PROX_ESTADO = ESPERA;
    endcase
    
end
endmodule