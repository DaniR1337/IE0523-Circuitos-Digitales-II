module TX(  input   CKP, CPH, CLK, ENB, RESET, MISO,
            output  SCK, CS,
            output  MOSI);

// Registros internos
reg [1:0]   CONTADOR = 0;
reg [31:0]  BIT_CONTADOR = 0;
reg [15:0]  REGISTRO = 16'h0605;
reg [2:0]   ESTADO = 0;  
reg [2:0]   PROX_ESTADO;  
reg         SCKL;

// Declaración de estados
parameter ESPERA    = 3'b000;
parameter MODO0     = 3'b001;
parameter MODO1     = 3'b011;
parameter MODO2     = 3'b110;
parameter MODO3     = 3'b100;

// Descripción de Flip-Flops
always @(posedge SCK or negedge SCK or posedge ENB or negedge ENB) begin
    ESTADO <= PROX_ESTADO;    
end

always @(*) begin
    if (!RESET) begin
        ESTADO <= ESPERA;
        REGISTRO <= 16'h0605;
        SCKL <= 0;
    end
end

// Un controlador se encargaría de CS
assign CS = !ENB; 

// Generación del SCK
always @(posedge CLK) begin
    if (ESTADO != ESPERA) begin
        if (!CS) begin
            SCKL = CONTADOR[1];
            if (CONTADOR == 2'b11) begin
                CONTADOR <= 2'b00;
            end else begin
                CONTADOR <= CONTADOR + 1;
            end       
        end else begin
            SCKL = CKP; 
        end
    end
end
assign SCK = SCKL;

// Lógica de proximo estado
always @(*) begin
    case (ESTADO)
        ESPERA: begin
            case ({CKP, CPH, CS, BIT_CONTADOR > 4'b1111})
                4'b0010:      PROX_ESTADO = MODO0;
                4'b0110:      PROX_ESTADO = MODO1;
                4'b1010:      PROX_ESTADO = MODO2;
                4'b1110:      PROX_ESTADO = MODO3;
                default:    PROX_ESTADO = ESPERA;
            endcase
        end
        MODO0:      PROX_ESTADO = (ENB) ? ((BIT_CONTADOR > 4'b1111) ? ESPERA : MODO0) : ESPERA;
        MODO1:      PROX_ESTADO = (ENB) ? ((BIT_CONTADOR > 4'b1111) ? ESPERA : MODO1) : ESPERA;
        MODO2:      PROX_ESTADO = (ENB) ? ((BIT_CONTADOR > 4'b1111) ? ESPERA : MODO2) : ESPERA;
        MODO3:      PROX_ESTADO = (ENB) ? ((BIT_CONTADOR > 4'b1111) ? ESPERA : MODO3) : ESPERA;
        default:    PROX_ESTADO = ESPERA;
    endcase
end

assign MOSI = REGISTRO[15];

// Lógica de estado
always @(negedge SCK) begin
    if (ESTADO == MODO1 | ESTADO == MODO2) begin
        REGISTRO <= REGISTRO << 1;
        REGISTRO[0] <= MISO; 
        BIT_CONTADOR <= BIT_CONTADOR + 1;
    end else begin
        if (ESTADO == ESPERA) begin
            BIT_CONTADOR = 0;
        end 
    end
end
always @(posedge SCK) begin
    if (ESTADO == MODO0 | ESTADO == MODO3) begin
        REGISTRO <= REGISTRO << 1;
        REGISTRO[0] <= MISO; 
        BIT_CONTADOR <= BIT_CONTADOR + 1;
    end else begin
        if (ESTADO == ESPERA) begin
            BIT_CONTADOR = 0;
        end 
    end
end

always @(negedge ENB) begin
    BIT_CONTADOR = 0;
end

endmodule

/*
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
        MISO = 1;
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
endmodule*/
