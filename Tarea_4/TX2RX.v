`include "TX.v"
`include "RX.v"

module TX2RX(input  CKP, CPH, CLK, ENB, RESET);

TX Transmisor(
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

 RX Receptor(
    .CKP(CKP),
    .CPH(CPH),
    .SCK(SCK),
    .SS(CS),
    .MOSI(MOSI),
    .MISO(MISO)
    );

endmodule

module TX2RX_tb;
    reg CKP, CPH, CLK, ENB, RESET;

    TX2RX TX2RX_inst (
        .CKP(CKP),
        .CPH(CPH),
        .CLK(CLK),
        .ENB(ENB),
        .RESET(RESET)
        );

    initial begin
        $dumpfile("resultados.vcd");
        $dumpvars(-1, TX2RX_tb);
        ENB = 0;
        CLK = 0;
        CPH = 1;
        CKP = 1;
        #20;
        ENB = 1;
        #200;
        #200;
        #200;
        #200;
        $finish;
    end

    always #5 CLK = !CLK;
endmodule

