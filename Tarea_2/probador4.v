module probador4(
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
    output [3:0] A, B;
    input [3:0] Q;
    input RCO;

    // Inputs
    reg CLK;
    reg ENB;
    reg [1:0] MODO;
    reg [3:0] A;
    reg [3:0] B;
    reg RCI;

    // Outputs
    wire [3:0] Q;
    wire RCO;

    // Initialize the inputs
    initial begin
        RCI = 0;

        // PRUEBA #1 SUMA DE 4 BITS
        MODO = 2'b11;
        ENB = 1;
        CLK = 0;

        #100;
        MODO = 2'b01;
        A = 4;
        B = 3;

        #100;
        RCI = 1;
        A = 4'b1111;
        B = 1'b1;

        #100;
        RCI = 0;
        A = 7;
        B = 2;

        #100;
        // PRUEBA #2 RESTA DE 4 BITS
        MODO = 2'b11; 

        #100;
        MODO = 2'b10;
        A = 4;
        B = 3;

        #100
        A = 2;
        B = 6;

        #100;
        
        A = 4'b1111;
        B = 1'b1;

        #100;
        // PRUEBA #3 MANTENER EL VALOR EN MODO 00 
        MODO = 2'b01; // OPERACION INICIAL
        A = 5;
        B = 3;
        
        #100;
        MODO = 2'b00; // MANTENER RESULTADO DE SUMA

        #100;
        // PRUEBA #4 MANTENER EL VALOR CUANDO ENB = 0
        MODO = 2'b10; // OPERACION INICIAL
        A = 3;
        B = 1;

        #100;
        ENB = 0;

        #100;
        $finish;
    end

    // Toggle the clock signal
    always #50 CLK = ~CLK;
    
endmodule