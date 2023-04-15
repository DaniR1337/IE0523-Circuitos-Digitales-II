/*NOTA PORQUE NO PIENSO A ESTAS HORAS. ¿QUE QUÉ HICE, PREGUNTAS? NI IDEA.
AL PARECER TANTO INPUTS COMO OUTPUTS AHORA DEBEN SER WIRES AL HABER AGREGADO EL PROBADOR. EL PROBADOR
RECIBE INPUTS Y OUTPUTS INVERTIDOS POR ALGUNA RAZÓN. TODOS LOS PORTS DEBEN VENIR EN LOS PARÉNTESIS DEL
PROBADOR. EL SUMADOR4 NO SE TOCÓ. TODO FUNCIONA EN ESTE MOMENTO, ASEGURATE DE QUE LO HAGA PARA SUMADOR8
Y SUMADOR32*/

`timescale 1ns/1ns
`include "sumador4.v"
`include "probador4.v"

module sumador4_tb;

    // Inputs
    wire CLK;
    wire ENB;
    wire [1:0] MODO;
    wire [3:0] A;
    wire [3:0] B;
    wire RCI;

    // Outputs
    wire [3:0] Q;
    wire RCO;

    initial begin
        $dumpfile("sumador4_tb.vcd");
        $dumpvars(0, sumador4_tb);
    end

    // Instantiate the design under test
    sumador4 U0 (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );
    probador4 P0 (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );

endmodule