// 22201064 - Tayaib Rafsun
// Control Unit for Set 4: LDI, ADD, STA, LDR, AND
// Reads the 4-bit opcode and produces the control signals.
//   alu_op: 00 = LDI (pass operand), 01 = ADD, 10 = AND
//   acc_we: 1 = write ACC (and update Z)
//   r_we  : 1 = write R   (STA)
//   sel_r : 1 = ACC takes the value of R instead of the ALU result (LDR)
module control_unit(
    input [3:0] opcode,
    output reg [1:0] alu_op,
    output reg acc_we,
    output reg r_we,
    output reg sel_r
);

    always @(*) begin
        // Default values = NOP (nothing changes)
        alu_op = 2'b00;
        acc_we = 1'b0;
        r_we   = 1'b0;
        sel_r  = 1'b0;
		  
		  case (opcode)
            4'b0001: begin alu_op = 2'b00; acc_we = 1'b1; end  // LDI
            4'b0010: begin alu_op = 2'b01; acc_we = 1'b1; end  // ADD
            4'b0100: begin alu_op = 2'b10; acc_we = 1'b1; end  // AND
            4'b1010: begin r_we = 1'b1; end                    // STA
            4'b1011: begin sel_r = 1'b1; acc_we = 1'b1; end    // LDR
            default: ;                                         // 0000 and any other opcode = NOP
        endcase
		  
    end
endmodule