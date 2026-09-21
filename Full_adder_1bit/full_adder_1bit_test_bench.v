// 22201064 - Tayaib Rafsun
// Test bench

`timescale 1ns / 1ps

module full_adder_1bit_tb;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder_1bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
	 
	initial begin
        // Initialize inputs
        A = 0; B = 0; Cin = 0;
        #100; // wait 100ns

        // Test all 8 combinations
        A = 0; B = 0; Cin = 0; #20;
        A = 0; B = 0; Cin = 1; #20;
        A = 0; B = 1; Cin = 0; #20;
        A = 0; B = 1; Cin = 1; #20;
        A = 1; B = 0; Cin = 0; #20;
        A = 1; B = 0; Cin = 1; #20;
        A = 1; B = 1; Cin = 0; #20;
        A = 1; B = 1; Cin = 1; #20; 
		  
		     $finish;
    end

endmodule