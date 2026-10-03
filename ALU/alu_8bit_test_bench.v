// 22201064 - Tayaib Rafsun
// Testbench for the 8-bit ALU (AND, OR, XOR, NOT, ADD, SUB)
`timescale 1ns / 1ps

module alu_8bit_top_tb;

    reg A0, A1, A2, A3, A4, A5, A6, A7;
    reg B0, B1, B2, B3, B4, B5, B6, B7;
    reg clk;
    reg op0, op1, op2;

    wire S0, S1, S2, S3, S4, S5, S6, S7;
    wire Cout;
	 
	 alu_8bit_top uut (
        .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7),
        .B0(B0), .B1(B1), .B2(B2), .B3(B3), .B4(B4), .B5(B5), .B6(B6), .B7(B7),
        .clk(clk),
        .op0(op0), .op1(op1), .op2(op2),
        .S0(S0), .S1(S1), .S2(S2), .S3(S3), .S4(S4), .S5(S5), .S6(S6), .S7(S7),
        .Cout(Cout)
    );

    // Clock generator: 20 ns period
    initial clk = 0;
    always #10 clk = ~clk;
	 
	 task set_A(input [7:0] val);
        begin
            A0=val[0]; A1=val[1]; A2=val[2]; A3=val[3];
            A4=val[4]; A5=val[5]; A6=val[6]; A7=val[7];
        end
    endtask
	 
	 task set_B(input [7:0] val);
        begin
            B0=val[0]; B1=val[1]; B2=val[2]; B3=val[3];
            B4=val[4]; B5=val[5]; B6=val[6]; B7=val[7];
        end
    endtask
	 
	 initial begin
        // Fixed operands for all 6 tests: A=12, B=10
        set_A(8'd12); set_B(8'd10);

        // Test 1: AND -> 12 & 10 = 8
        op2=0; op1=0; op0=0; #20;

        // Test 2: OR -> 12 | 10 = 14
        op2=0; op1=0; op0=1; #20;

        // Test 3: XOR -> 12 ^ 10 = 6
        op2=0; op1=1; op0=0; #20;
		  
		  // Test 4: NOT (A only) -> ~12 = 243
        op2=0; op1=1; op0=1; #20;

        // Test 5: ADD -> 12 + 10 = 22, Cout=0
        op2=1; op1=0; op0=0; #20;

        // Test 6: SUB -> 12 - 10 = 2, Bout=1 (no borrow)
        op2=1; op1=0; op0=1; #20;

        $finish;
    end
	 
endmodule