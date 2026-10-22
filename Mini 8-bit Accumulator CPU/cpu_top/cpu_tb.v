// 22201064 - Tayaib Rafsun
// Testbench for the Mini 8-bit Accumulator CPU (Set 4 program)
`timescale 1ns / 1ps

module cpu_tb;

    reg CLK;
    reg RESET;
    wire [7:0] Q;
    wire Z;
    wire [3:0] PC;

    cpu_top uut (
        .CLK(CLK), .RESET(RESET),
        .Q(Q), .Z(Z), .PC(PC)
    );
	 
	 // Copy of the internal R register so it shows up in the waveform
    wire [7:0] R;
    assign R = uut.R_val;
	 
	 // Clock generator: 10 ns period (toggles every 5 ns)
    initial CLK = 0;
    always #5 CLK = ~CLK;

    initial begin
        // Hold RESET high for two rising edges: PC=0, ACC=0, R=0, Z=1
        RESET = 1;
        @(posedge CLK);
        @(posedge CLK);
        #1;
        $display("After reset : PC=%d  Q=%b  Z=%b  R=%b", PC, Q, Z, uut.R_val);


// Release reset and run the 10 instructions of the Set 4 program
        RESET = 0;
        repeat (10) begin
            @(posedge CLK);
            #1;
            $display("PC=%d  Q=%b (%h)  Z=%b  R=%b", PC, Q, Q, Z, uut.R_val);
        end

        $finish;
    end

endmodule