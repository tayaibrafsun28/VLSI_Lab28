`timescale 1ns / 1ps
module control_unit_tb;
    reg [3:0] opcode;
    wire [1:0] alu_op;
    wire acc_we, r_we, sel_r;

    control_unit uut (.opcode(opcode), .alu_op(alu_op),
                      .acc_we(acc_we), .r_we(r_we), .sel_r(sel_r));
							 
							 
	initial begin
        $monitor("t=%0t  opcode=%b | alu_op=%b acc_we=%b r_we=%b sel_r=%b",
                 $time, opcode, alu_op, acc_we, r_we, sel_r);
        opcode = 4'b0001; #10;  // LDI  : 00 1 0 0
        opcode = 4'b0010; #10;  // ADD  : 01 1 0 0
        opcode = 4'b0100; #10;  // AND  : 10 1 0 0
		  opcode = 4'b1010; #10;  // STA  : 00 0 1 0
        opcode = 4'b1011; #10;  // LDR  : 00 1 0 1
        opcode = 4'b0000; #10;  // NOP  : 00 0 0 0
        opcode = 4'b1111; #10;  // unused opcode -> NOP : 00 0 0 0
        $finish;
    end
endmodule