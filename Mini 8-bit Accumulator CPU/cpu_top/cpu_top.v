// 22201064 - Tayaib Rafsun
// Mini 8-bit Accumulator CPU (Set 4: LDI, ADD, STA, LDR, AND)
// Structural top level: connects PC, Program ROM, Control Unit, ALU and ACC/R/Z.
module cpu_top(
    input CLK,
    input RESET,
    output [7:0] Q,    // ACC (CPU output)
    output Z,          // zero flag
    output [3:0] PC    // program counter
);

    wire [11:0] instr;       // instruction read from the ROM
    wire [3:0]  opcode;
    wire [7:0]  operand;
    wire [1:0]  alu_op;
    wire        acc_we, r_we, sel_r;
    wire [7:0]  alu_result;
    wire [7:0]  R_val;       // value held in R (internal, add it to the waveform)

    assign opcode  = instr[11:8];
    assign operand = instr[7:0];
	 
	 
	  program_counter u_pc (
        .CLK(CLK), .RESET(RESET), .PC(PC)
    );

    program_rom u_rom (
        .addr(PC), .instr(instr)
    );

    control_unit u_cu (
        .opcode(opcode), .alu_op(alu_op),
        .acc_we(acc_we), .r_we(r_we), .sel_r(sel_r)
    );
	 
	 
	  alu u_alu (
        .acc(Q), .operand(operand), .alu_op(alu_op), .result(alu_result)
    );

    acc_r_z u_regs (
        .CLK(CLK), .RESET(RESET),
        .alu_result(alu_result), .sel_r(sel_r), .acc_we(acc_we), .r_we(r_we),
        .ACC(Q), .R(R_val), .Z(Z)
    );
	 
endmodule