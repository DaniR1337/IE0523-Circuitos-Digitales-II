module probador8(
    CLK,
    ENB,
    RCI,
    MODO,
    A,
    B,
    Q,
    RCO
);

    output CLK, ENB, RCI;
    output [1:0] MODO;
    output [7:0] A, B;
    input [7:0] Q;
    input RCO;

    // Inputs
    reg CLK;
    reg ENB;
    reg [1:0] MODO;
    reg [7:0] A;
    reg [7:0] B;
    reg RCI;

    // Outputs
    wire [7:0] Q;
    wire RCO;

    // Initialize the inputs
    initial begin
        RCI = 0;

        // PRUEBA #1 SUMA DE 8 BITS
        MODO = 2'b11;
        A = 64;
        B = 4;
        ENB = 1;
        CLK = 0;

        #10;
        MODO = 2'b01;
        A = 8'd17;
        B = 8'd3;

        #10;
        A = 8'b11111111;
        B = 1'b1;

        #10;
        A = 7;
        B = 2;
        RCI = 1;

        #10;
        RCI = 0;
        // PRUEBA #2 RESTA DE 8 BITS
        A = 1;
        B = 2;
        MODO = 2'b11; 

        #10;
        MODO = 2'b10;
        A = 4;
        B = 3;

        #10;
        A = 200;
        B = 50;

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
        A = 7;
        B = 8;

        #10;
        // PRUEBA #4 MANTENER EL VALOR CUANDO ENB = 0
        MODO = 2'b10; // OPERACION INICIAL
        A = 3;
        B = 1;

        #10;
        ENB = 0;
        A = 4;
        B = 5;


        #10;
        $finish;
    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;
    
endmodule