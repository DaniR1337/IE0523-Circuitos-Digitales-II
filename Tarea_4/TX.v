module TX(  input   CKP, CPH, CLK, RESET, MISO,
            output  SCK, CS, MOSI);

// Generación del SCK
always @(posedge CLK) begin
    if (CONTADOR == 2'b11) begin
        CONTADOR <= 2'b00;
    end else begin
        CONTADOR <= CONTADOR + 1;
    end
end
assign SCK = &CONTADOR;

// Registros internos
reg [1:0]   CONTADOR;
reg [13:0]  REGISTRO;
reg [7:0]   BYTE_OUT;
reg [7:0]   BYTE_IN;
reg [2:0]   ESTADO;  
reg [2:0]   PROX_ESTADO;  

// Declaración de estados
parameter ESPERA    = 3'b001;
parameter OPERACION = 3'b010;
parameter FINAL     = 3'b100;

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
        ESPERA: ;
        OPERACION:  ;
        FINAL:      ;
        default: PROX_ESTADO = ESPERA;
    endcase
    
end




endmodule