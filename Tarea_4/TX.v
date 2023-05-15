module TX(  input   CKP, CPH, CLK, ENB, RESET, MISO,
            output  SCK, CS,
            output  reg MOSI);
/*
// Declaración de estados
parameter ESPERA    = 3'b000;
parameter MODO0     = 3'b001;
parameter MODO1     = 3'b011;
parameter MODO2     = 3'b110;
parameter MODO3     = 3'b100;
parameter FINAL     = 3'b101;
*/
/*
// Descripción de Flip-Flops
always @(posedge SCK) begin
    if (!RESET) begin
        ESTADO <= ESPERA;
    end else begin
        ESTADO <= PROX_ESTADO;    
    end
end*/

// Registros internos
reg [1:0]   CONTADOR;
reg [7:0]   REGISTRO = 8'h65;
/*
reg [2:0]   ESTADO;  
reg [2:0]   PROX_ESTADO;  
*/
assign CS = !ENB; // Un controlador se encargaría de CS

// Generación del SCK
always @(posedge CLK) begin
    if (CONTADOR == 2'b11) begin
        CONTADOR <= 2'b00;
    end else begin
        CONTADOR <= CONTADOR + 1;
    end
end

assign SCK = (!CS) ? CONTADOR[1] : ((CKP) ? 1'b1 : 1'b0);

always @(*) begin
    if (!ENB) begin
        case ({CKP, CPH})
            2'b00: ;
            2'b01: ;
            2'b10: ;
            2'b11: ;
        endcase
    end    
end




/*
// Lógica de proximo estado
always @(*) begin
    case (ESTADO)
        ESPERA: begin
            case ({CKP, CPH})
                2'b00: PROX_ESTADO = MODO0;
                2'b01: PROX_ESTADO = MODO1;
                2'b10: PROX_ESTADO = MODO2;
                2'b11: PROX_ESTADO = MODO3;
                default: 
            endcase
        end
        MODO0: PROX_ESTADO = (ENB) ? MODO0 : FINAL;
        MODO1: PROX_ESTADO = (ENB) ? MODO1 : FINAL
        MODO2: PROX_ESTADO = (ENB) ? MODO2 : FINAL
        MODO3: PROX_ESTADO = (ENB) ? MODO3 : FINAL
        FINAL: PROX_ESTADO = ESPERA;
    endcase
end

// Lógica en cada estado
always @(ESTADO) begin
    case
end*/



always @(posedge SCK) begin
    if (ENB) begin
        case ({CKP, CPH})
            2'b00: begin
                REGISTRO[0] <= MISO;  
                MOSI        <= REGISTRO[15];
                REGISTRO    <= REGISTRO << 1;  
            end
            2'b01: begin
                REGISTRO[0] <= MISO;  
                MOSI        <= REGISTRO[15];
                REGISTRO    <= REGISTRO << 1;  
            end
            2'b10: begin
                REGISTRO[0] <= MISO;  
                MOSI        <= REGISTRO[15];
                REGISTRO    <= REGISTRO << 1;  
            end
            2'b11: begin
                REGISTRO[0] <= MISO;  
                MOSI        <= REGISTRO[15];
                REGISTRO    <= REGISTRO << 1;  
            end 
        endcase
    end
end

endmodule

// Intercambio de información
/*
always @(posedge SCK) begin
    REGISTRO[0] <= MISO;  
    MOSI        <= REGISTRO[15];
    REGISTRO    <= REGISTRO << 1;  
end*/
/*
reg [2:0]   ESTADO;  
reg [2:0]   PROX_ESTADO;  */
/*
// Declaración de estados
parameter ESPERA    = 4'b0001;
parameter SET_CS    = 4'b0010;
parameter OPERACION = 4'b0100;
parameter FINAL     = 4'b1000;
*/
/*
// Descripción de Flip-Flops
always @(posedge SCK) begin
    if (!RESET) begin
        ESTADO <= ESPERA;
    end else begin
        ESTADO <= PROX_ESTADO;    
    end
end*/