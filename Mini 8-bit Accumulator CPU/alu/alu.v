// 22201064 - Tayaib Rafsun
// ALU: combinational, works on ACC and the 8-bit operand.
// Reuses add_8bit and and_8bit; a small mux picks the result.
module alu(
    input  [7:0] acc,
    input  [7:0] operand,
    input  [1:0] alu_op,      // 00 = LDI, 01 = ADD, 10 = AND
    output [7:0] result
);
    wire [7:0] sum_res;
    wire [7:0] and_res;
    wire       cout_unused;   // carry-out is discarded
	 
	 add_8bit u_add (
        .A0(acc[0]), .A1(acc[1]), .A2(acc[2]), .A3(acc[3]),
        .A4(acc[4]), .A5(acc[5]), .A6(acc[6]), .A7(acc[7]),
        .B0(operand[0]), .B1(operand[1]), .B2(operand[2]), .B3(operand[3]),
        .B4(operand[4]), .B5(operand[5]), .B6(operand[6]), .B7(operand[7]),
        .S0(sum_res[0]), .S1(sum_res[1]), .S2(sum_res[2]), .S3(sum_res[3]),
        .S4(sum_res[4]), .S5(sum_res[5]), .S6(sum_res[6]), .S7(sum_res[7]),
        .Cout(cout_unused)
    );
	 
	 
	 and_8bit u_and (
        .A0(acc[0]), .A1(acc[1]), .A2(acc[2]), .A3(acc[3]),
        .A4(acc[4]), .A5(acc[5]), .A6(acc[6]), .A7(acc[7]),
        .B0(operand[0]), .B1(operand[1]), .B2(operand[2]), .B3(operand[3]),
        .B4(operand[4]), .B5(operand[5]), .B6(operand[6]), .B7(operand[7]),
        .Y0(and_res[0]), .Y1(and_res[1]), .Y2(and_res[2]), .Y3(and_res[3]),
        .Y4(and_res[4]), .Y5(and_res[5]), .Y6(and_res[6]), .Y7(and_res[7])
    );
	 
	 
	     // Pick the result: ADD, AND, or (LDI) pass the operand straight through
    assign result = (alu_op == 2'b01) ? sum_res :
                    (alu_op == 2'b10) ? and_res :
                    operand;
endmodule