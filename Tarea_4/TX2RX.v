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

