`timescale 1ns/1ns
`include "TX2RX.v"
`include "probador.v"

module testbench;

// Inputs
wire CKP, CPH, CLK, ENB, RESET;

initial begin
    $dumpfile("resultados.vcd");
    $dumpvars(-1, testbench);
end

// Instantiate the design under test as well as the tester
TX2RX DUT(
    .CKP(CKP),
    .CPH(CPH),
    .CLK(CLK),
    .ENB(ENB),
    .RESET(RESET)
);

probador PO(
    .CKP(CKP),
    .CPH(CPH),
    .CLK(CLK),
    .ENB(ENB),
    .RESET(RESET)
);


endmodule