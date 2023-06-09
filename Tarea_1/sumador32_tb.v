`timescale 1ns/1ns
//`include "sumador32.v"
`include "sumador32.v"

module sumador32_tb;

    // Inputs
    reg CLK;
    reg ENB;
    reg [1:0] MODO;
    reg [31:0] A;
    reg [31:0] B;
    reg RCI;

    // Outputs
    wire [31:0] Q;
    wire RCO;

    // Instantiate the design under test
    sumador32 dut (
        .CLK(CLK),
        .ENB(ENB),
        .MODO(MODO),
        .RCI(RCI),
        .A(A),
        .B(B),
        .Q(Q),
        .RCO(RCO)
    );
    

    // Initialize the inputs
    initial begin
        $dumpfile("sumador32_tb.vcd");
        $dumpvars(0, sumador32_tb);

        
        RCI = 0;

        // PRUEBA #1 SUMA DE 4 BITS
        MODO = 2'b11;
        ENB = 1;
        CLK = 0;


        #10;
        MODO = 2'b01;
        A = 17;
        B = 3;

        #10;
        A = 1;
        B = 32'hFFFFFFFF;

        #10;
        #10;
        #10;
        A = 7;
        B = 2;

        #10;
        // PRUEBA #2 RESTA DE 4 BITS
        MODO = 2'b11; 

        #10;
        MODO = 2'b10;
        A = 4;
        B = 3;

        #10;
        A = 4'b1111;
        B = 1'b1;

        #10;
        A = 3;
        B = 8;

        #10;
        // PRUEBA #3 MANTENER EL VALOR EN MODO 00 
        MODO = 2'b01; // OPERACION INICIAL
        A = 5;
        B = 3;
        
        #10;
        MODO = 2'b00; // MANTENER RESULTADO DE SUMA

        #10;
        // PRUEBA #4 MANTENER EL VALOR CUANDO ENB = 0
        MODO = 2'b10; // OPERACION INICIAL
        A = 3;
        B = 1;

        #10;
        ENB = 0;

        #10;
        $finish;
    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;

    
    

endmodule
