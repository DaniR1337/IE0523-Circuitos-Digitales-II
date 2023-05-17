module TX(  input   CKP, CPH, CLK, ENB, RESET, MISO,
            output  SCK, CS,
            output  reg MOSI);

// Registros internos
reg [1:0]   CONTADOR = 0;
reg [7:0]   REGISTRO = 8'h65;
reg [2:0]   ESTADO;  
reg [2:0]   PROX_ESTADO;  
reg         SCKL;

// Declaración de estados
parameter ESPERA    = 3'b000;
parameter MODO0     = 3'b001;
parameter MODO1     = 3'b011;
parameter MODO2     = 3'b110;
parameter MODO3     = 3'b100;
parameter FINAL     = 3'b101;

// Descripción de Flip-Flops
always @(posedge CLK) begin
    if (!RESET) begin
        ESTADO <= ESPERA;
    end else begin
        ESTADO <= PROX_ESTADO;    
    end
end

// Un controlador se encargaría de CS
assign CS = !ENB; 

// Generación del SCK
always @(posedge CLK) begin
    if (!CS) begin
        SCKL = (CPH) ? !CONTADOR[1] : CONTADOR[1];
        if (CONTADOR == 2'b11) begin
            CONTADOR <= 2'b00;
        end else begin
            CONTADOR <= CONTADOR + 1;
        end       
    end else begin
        SCKL = CKP; 
    end
end
assign SCK = SCKL;

// Lógica de proximo estado
always @(*) begin
    case (ESTADO)
        ESPERA: begin
            case ({CKP, CPH, ENB})
                3'b001:      PROX_ESTADO = MODO0;
                3'b011:      PROX_ESTADO = MODO1;
                3'b101:      PROX_ESTADO = MODO2;
                3'b111:      PROX_ESTADO = MODO3;
                default:    PROX_ESTADO = ESPERA;
            endcase
        end
        MODO0:      PROX_ESTADO = (ENB) ? MODO0 : FINAL;
        MODO1:      PROX_ESTADO = (ENB) ? MODO1 : FINAL;
        MODO2:      PROX_ESTADO = (ENB) ? MODO2 : FINAL;
        MODO3:      PROX_ESTADO = (ENB) ? MODO3 : FINAL;
        FINAL:      PROX_ESTADO = ESPERA;
        default:    PROX_ESTADO = ESPERA;
    endcase
end




endmodule


module TX_tb;
wire MOSI, SCK, CS;
reg CKP, CPH, CLK, ENB, RESET, MISO;

TX DUT(
  .CKP(CKP),
  .CPH(CPH),
  .CLK(CLK),
  .ENB(ENB),
  .RESET(RESET),
  .MISO(MISO),
  .SCK(SCK),
  .CS(CS),
  .MOSI(MOSI)
);

initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, TX_tb);
    CPH = 1;
    CKP = 0;
    CLK = 0;
    ENB = 0;
    #10;
    ENB = 1;
    #100;
    ENB = 0;
    #50;
    CKP = 1;
    #50;
    ENB = 0;
    #10;
    ENB = 1;
    #100;
    ENB = 0;
    #100;
    $finish;
end

always #5 CLK = !CLK;


endmodule
