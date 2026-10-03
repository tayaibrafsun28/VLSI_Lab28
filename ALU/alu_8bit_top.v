// 22201064 - Tayaib Rafsun
// Top-level 8-bit ALU: AND, OR, XOR, NOT, ADD, SUB
// Operand A and B are stored in 8-bit registers, loaded on the rising edge of clk.
// Operation select: op2 op1 op0
//   000 = AND   001 = OR    010 = XOR
//   011 = NOT (of A)        100 = ADD   101 = SUB

module alu_8bit_top(
    input A0, A1, A2, A3, A4, A5, A6, A7,   // Operand A
    input B0, B1, B2, B3, B4, B5, B6, B7,   // Operand B
    input clk,
	 input op0, op1, op2,                    // Operation select
    output S0, S1, S2, S3, S4, S5, S6, S7,  // ALU result
    output Cout                              // Valid only for ADD/SUB
);

 // ---- Register A and Register B: latch operands on clk ----
    wire qA0, qA1, qA2, qA3, qA4, qA5, qA6, qA7;
    wire qB0, qB1, qB2, qB3, qB4, qB5, qB6, qB7;
	 
	  register_8bit regA (
        .D0(A0), .D1(A1), .D2(A2), .D3(A3), .D4(A4), .D5(A5), .D6(A6), .D7(A7),
        .clk(clk),
        .Q0(qA0), .Q1(qA1), .Q2(qA2), .Q3(qA3), .Q4(qA4), .Q5(qA5), .Q6(qA6), .Q7(qA7)
    );

 register_8bit regB (
        .D0(B0), .D1(B1), .D2(B2), .D3(B3), .D4(B4), .D5(B5), .D6(B6), .D7(B7),
        .clk(clk),
        .Q0(qB0), .Q1(qB1), .Q2(qB2), .Q3(qB3), .Q4(qB4), .Q5(qB5), .Q6(qB6), .Q7(qB7)
    );
	 
	 
	 // ---- All five operation units run in parallel on the stored operands ----
    
	 wire and0, and1, and2, and3, and4, and5, and6, and7;
    and_8bit u_and (
        .A0(qA0), .A1(qA1), .A2(qA2), .A3(qA3), .A4(qA4), .A5(qA5), .A6(qA6), .A7(qA7),
        .B0(qB0), .B1(qB1), .B2(qB2), .B3(qB3), .B4(qB4), .B5(qB5), .B6(qB6), .B7(qB7),
        .Y0(and0), .Y1(and1), .Y2(and2), .Y3(and3), .Y4(and4), .Y5(and5), .Y6(and6), .Y7(and7)
    );
	 
	 wire or0, or1, or2, or3, or4, or5, or6, or7;
    or_8bit u_or (
        .A0(qA0), .A1(qA1), .A2(qA2), .A3(qA3), .A4(qA4), .A5(qA5), .A6(qA6), .A7(qA7),
        .B0(qB0), .B1(qB1), .B2(qB2), .B3(qB3), .B4(qB4), .B5(qB5), .B6(qB6), .B7(qB7),
        .Y0(or0), .Y1(or1), .Y2(or2), .Y3(or3), .Y4(or4), .Y5(or5), .Y6(or6), .Y7(or7)
    );
	 
	 wire xor0, xor1, xor2, xor3, xor4, xor5, xor6, xor7;
    xor_8bit u_xor (
        .A0(qA0), .A1(qA1), .A2(qA2), .A3(qA3), .A4(qA4), .A5(qA5), .A6(qA6), .A7(qA7),
        .B0(qB0), .B1(qB1), .B2(qB2), .B3(qB3), .B4(qB4), .B5(qB5), .B6(qB6), .B7(qB7),
        .Y0(xor0), .Y1(xor1), .Y2(xor2), .Y3(xor3), .Y4(xor4), .Y5(xor5), .Y6(xor6), .Y7(xor7)
    );
	 
	 wire not0, not1, not2, not3, not4, not5, not6, not7;
    not_8bit u_not (
        .A0(qA0), .A1(qA1), .A2(qA2), .A3(qA3), .A4(qA4), .A5(qA5), .A6(qA6), .A7(qA7),
        .Y0(not0), .Y1(not1), .Y2(not2), .Y3(not3), .Y4(not4), .Y5(not5), .Y6(not6), .Y7(not7)
    );
	 
	  wire addS0, addS1, addS2, addS3, addS4, addS5, addS6, addS7, addCout;
    add_8bit u_add (
        .A0(qA0), .A1(qA1), .A2(qA2), .A3(qA3), .A4(qA4), .A5(qA5), .A6(qA6), .A7(qA7),
        .B0(qB0), .B1(qB1), .B2(qB2), .B3(qB3), .B4(qB4), .B5(qB5), .B6(qB6), .B7(qB7),
        .S0(addS0), .S1(addS1), .S2(addS2), .S3(addS3), .S4(addS4), .S5(addS5), .S6(addS6), .S7(addS7),
        .Cout(addCout)
    );
	 
	  wire subD0, subD1, subD2, subD3, subD4, subD5, subD6, subD7, subBout;
    subtractor_8bit u_sub (
        .A0(qA0), .A1(qA1), .A2(qA2), .A3(qA3), .A4(qA4), .A5(qA5), .A6(qA6), .A7(qA7),
        .B0(qB0), .B1(qB1), .B2(qB2), .B3(qB3), .B4(qB4), .B5(qB5), .B6(qB6), .B7(qB7),
        .D0(subD0), .D1(subD1), .D2(subD2), .D3(subD3), .D4(subD4), .D5(subD5), .D6(subD6), .D7(subD7),
        .Bout(subBout)
    );
	 
	 
	 // ---- Output mux: picks the right result based on op2,op1,op0 ----
    
	 assign S0 = (!op2 && !op1 && !op0) ? and0 :
                (!op2 && !op1 &&  op0) ? or0  :
                (!op2 &&  op1 && !op0) ? xor0 :
                (!op2 &&  op1 &&  op0) ? not0 :
                ( op2 && !op1 && !op0) ? addS0 :
                ( op2 && !op1 &&  op0) ? subD0 : 1'b0;
	
	 assign S1 = (!op2 && !op1 && !op0) ? and1 :
                (!op2 && !op1 &&  op0) ? or1  :
                (!op2 &&  op1 && !op0) ? xor1 :
                (!op2 &&  op1 &&  op0) ? not1 :
                ( op2 && !op1 && !op0) ? addS1 :
                ( op2 && !op1 &&  op0) ? subD1 : 1'b0;
	
	 assign S2 = (!op2 && !op1 && !op0) ? and2 :
                (!op2 && !op1 &&  op0) ? or2  :
                (!op2 &&  op1 && !op0) ? xor2 :
                (!op2 &&  op1 &&  op0) ? not2 :
                ( op2 && !op1 && !op0) ? addS2 :
                ( op2 && !op1 &&  op0) ? subD2 : 1'b0;
					 
	 assign S3 = (!op2 && !op1 && !op0) ? and3 :
                (!op2 && !op1 &&  op0) ? or3  :
                (!op2 &&  op1 && !op0) ? xor3 :
                (!op2 &&  op1 &&  op0) ? not3 :
                ( op2 && !op1 && !op0) ? addS3 :
                ( op2 && !op1 &&  op0) ? subD3 : 1'b0;
					 
					 
    assign S4 = (!op2 && !op1 && !op0) ? and4 :
                (!op2 && !op1 &&  op0) ? or4  :
                (!op2 &&  op1 && !op0) ? xor4 :
                (!op2 &&  op1 &&  op0) ? not4 :
                ( op2 && !op1 && !op0) ? addS4 :
                ( op2 && !op1 &&  op0) ? subD4 : 1'b0; 
					 
    assign S5 = (!op2 && !op1 && !op0) ? and5 :
                (!op2 && !op1 &&  op0) ? or5  :
                (!op2 &&  op1 && !op0) ? xor5 :
                (!op2 &&  op1 &&  op0) ? not5 :
                ( op2 && !op1 && !op0) ? addS5 :
                ( op2 && !op1 &&  op0) ? subD5 : 1'b0;
					 
    assign S6 = (!op2 && !op1 && !op0) ? and6 :
                (!op2 && !op1 &&  op0) ? or6  :
                (!op2 &&  op1 && !op0) ? xor6 :
                (!op2 &&  op1 &&  op0) ? not6 :
                ( op2 && !op1 && !op0) ? addS6 :
                ( op2 && !op1 &&  op0) ? subD6 : 1'b0;
	
	 assign S7 = (!op2 && !op1 && !op0) ? and7 :
                (!op2 && !op1 &&  op0) ? or7  :
                (!op2 &&  op1 && !op0) ? xor7 :
                (!op2 &&  op1 &&  op0) ? not7 :
                ( op2 && !op1 && !op0) ? addS7 :
                ( op2 && !op1 &&  op0) ? subD7 : 1'b0;
	
	 assign Cout = ( op2 && !op1 && !op0) ? addCout :
                  ( op2 && !op1 &&  op0) ? subBout : 1'b0;

endmodule
