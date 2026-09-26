// 22201064 - Tayaib Rafsun
// Testbench for 8-bit Full Adder

`timescale 1ns / 1ps

module full_adder_8bit_tb;

    // Inputs
    reg A0, A1, A2, A3, A4, A5, A6, A7;
    reg B0, B1, B2, B3, B4, B5, B6, B7;
    reg Cin;

    // Outputs
    wire S0, S1, S2, S3, S4, S5, S6, S7;
    wire Cout;
	 
	 // Instantiate the Unit Under Test (UUT)
    full_adder_8bit uut (
        .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3), .B4(B4), .B5(B5), .B6(B6), .B7(B7),
        .Cin(Cin),
        .S0(S0), .S1(S1), .S2(S2), .S3(S3),
        .S4(S4), .S5(S5), .S6(S6), .S7(S7),
        .Cout(Cout)
    );
	 
	 
	 // Helper tasks to load an 8-bit value bit-by-bit into A or B
    task set_A(input [7:0] val);
        begin
            A0 = val[0]; A1 = val[1]; A2 = val[2]; A3 = val[3];
            A4 = val[4]; A5 = val[5]; A6 = val[6]; A7 = val[7];
        end
    endtask
	 
	 task set_B(input [7:0] val);
        begin
            B0 = val[0]; B1 = val[1]; B2 = val[2]; B3 = val[3];
            B4 = val[4]; B5 = val[5]; B6 = val[6]; B7 = val[7];
        end
    endtask
	 
	 
	  initial begin
        Cin = 0;

        // Test 1: 15 + 10 = 25 (no overflow)
        set_A(8'd15); set_B(8'd10); #20;

        // Test 2: 200 + 100 = 300 -> overflows 8 bits (expect Cout=1, Sum=44)
        set_A(8'd200); set_B(8'd100); #20;

        // Test 3: 255 + 1 = 256 -> overflows (expect Cout=1, Sum=0)
        set_A(8'd255); set_B(8'd1); #20;

        // Test 4: with Cin=1: 5 + 10 + 1 = 16
        Cin = 1;
        set_A(8'd5); set_B(8'd10); #20;

        $finish;
    end
	 
	 endmodule