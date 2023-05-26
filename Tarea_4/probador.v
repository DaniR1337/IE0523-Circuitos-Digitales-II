module probador(output reg  CKP, CPH, CLK, ENB, RESET);

    // Initialize the inputs
    initial begin
        RESET = 1; CLK = 0; ENB = 0; CPH = 0; CKP = 0;
        #200; ENB = 1;
        #800; ENB = 0;  CPH = 1; CKP = 0;
        #60; ENB = 1;
        #750; CKP = 1; 
        #50; ENB = 0; CPH = 0; CKP = 1;
        #60; ENB = 1;
        #800; ENB = 0; CPH = 1; CKP = 1;
        #60; ENB = 1;
        #800; ENB = 0;
        #100; RESET = 0;
        #100; RESET = 1;
        #400;
        $finish;
    end

    // Toggle the clock signal
    always #5 CLK = ~CLK;
    
endmodule