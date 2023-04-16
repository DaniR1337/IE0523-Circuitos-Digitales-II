module probador32(
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
    output [31:0] A, B;
    input [31:0] Q;
    input RCO;

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

    // Initialize the inputs
    initial begin 
 
        RCI = 0;

        // PRUEBA #1 SUMA DE 4 BITS
        MODO = 2'b11;
        A = 6969;
        B = 42; 
        ENB = 1;
        CLK = 0;


        #10;
        MODO = 2'b01;
        A = 16547;
        B = 32;

        #10;
        A = 1;
        B = 32'hFFFFFFFF;

        #10;
        RCI = 1;
        A = 99998;
        B = 1;

        #10;
        RCI = 0;
        A = 67543;
        B = 33;
        // PRUEBA #2 RESTA DE 4 BITS
        MODO = 2'b11; 

        #10;
        MODO = 2'b10;
        A = 5000;
        B = 800;

        #10;
        A = 123456789;
        B = 333333;

        #10;
        A = 3;
        B = 8;

        #10;
        // PRUEBA #3 MANTENER EL VALOR EN MODO 00 
        MODO = 2'b01; // OPERACION INICIAL
        A = 32'd6603;
        B = 32'd366;
        
        #10;
        A = 6666;
        B = 9999;
        MODO = 2'b00; // MANTENER RESULTADO DE SUMA

        #10;
        // PRUEBA #4 MANTENER EL VALOR CUANDO ENB = 0
        MODO = 2'b10; // OPERACION INICIAL
        A = 9999999;
        B = 32'h74261A;

        #10;
        A = 12345;
        B = 6789;
        ENB = 0;

        #10;
        $finish;
    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;
    
endmodule