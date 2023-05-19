module RX(  input   CKP, CPH, SCK, SS, MOSI,
            output  MISO);

// Registros internos
reg [1:0]   CONTADOR = 0;
reg [15:0]   REGISTRO = 16'h0705;
reg [2:0]   ESTADO = 0;  
reg [2:0]   PROX_ESTADO;  
reg         SCKL;

// Declaración de estados
parameter ESPERA    = 3'b000;
parameter MODO0     = 3'b001;
parameter MODO1     = 3'b011;
parameter MODO2     = 3'b110;
parameter MODO3     = 3'b100;
//parameter FINAL     = 3'b101;

// Descripción de Flip-Flops
always @(posedge SCK or negedge SCK) ESTADO <= PROX_ESTADO; 
  
// Lógica de próximo estado
always @(*) begin
    case (ESTADO)
        ESPERA: begin
            case ({CKP, CPH, !SS})
                3'b001:      PROX_ESTADO = MODO0;
                3'b011:      PROX_ESTADO = MODO1;
                3'b101:      PROX_ESTADO = MODO2;
                3'b111:      PROX_ESTADO = MODO3;
                default:    PROX_ESTADO = ESPERA;
            endcase
        end
        MODO0:      PROX_ESTADO = (!SS) ? MODO0 : ESPERA;
        MODO1:      PROX_ESTADO = (!SS) ? MODO1 : ESPERA;
        MODO2:      PROX_ESTADO = (!SS) ? MODO2 : ESPERA;
        MODO3:      PROX_ESTADO = (!SS) ? MODO3 : ESPERA;
        //FINAL:      PROX_ESTADO = ESPERA;
        default:    PROX_ESTADO = ESPERA;
    endcase
end
/*
always @(SS) begin
    ESTADO = (!SS) ? ESTADO : ESPERA;
end*/

assign MISO = REGISTRO[15];

// Lógica de estado
always @(negedge SCK) begin
    if (ESTADO == MODO1 | ESTADO == MODO2) begin
        REGISTRO = REGISTRO << 1; 
        REGISTRO[0] <= MOSI;
    end
end
always @(posedge SCK) begin
    if (ESTADO == MODO0 | ESTADO == MODO3) begin
        REGISTRO = REGISTRO << 1; 
        REGISTRO[0] <= MOSI;
    end
end
endmodule
/*
module RX_tb;
    reg CKP, CPH, SCK, SS, MOSI;
    wire MISO;

    RX DUT(
    .CKP(CKP),
    .CPH(CPH),
    .SCK(SCK),
    .SS(SS),
    .MOSI(MOSI),
    .MISO(MISO)
    );

    initial begin
        $dumpfile("resultados.vcd");
        $dumpvars(-1, RX_tb);
        MOSI = 0;
        SCK = 0;
        CPH = 0;
        CKP = 0;
        SS = 1;
        #10;
        SS = 0;
        #100;
        $finish;
    end

    always #5 SCK = !SCK;
endmodule
*/