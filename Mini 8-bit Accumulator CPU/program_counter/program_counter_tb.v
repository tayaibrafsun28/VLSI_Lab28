`timescale 1ns / 1ps
module program_counter_tb;
    reg CLK, RESET;
    wire [3:0] PC;

    program_counter uut (.CLK(CLK), .RESET(RESET), .PC(PC));

    initial CLK = 0;
    always #5 CLK = ~CLK;

    initial begin
        $monitor("t=%0t  RESET=%b PC=%d", $time, RESET, PC);
        RESET = 1;
        @(posedge CLK);
        @(posedge CLK);
		  
		  #1;                          // PC = 0
        RESET = 0;
        repeat (6) @(posedge CLK);   // PC counts 1..6
        #1;
        RESET = 1;                   // reset in the middle of counting
        @(posedge CLK);
        #1;                          // PC returns to 0
        RESET = 0;
        repeat (4) @(posedge CLK);   // counts 1..4 again
        #1;
        $finish;
    end
endmodule