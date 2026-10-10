// 22201064 - Tayaib Rafsun
// Program ROM: 16 locations x 12 bits, read combinationally using addr (no clock)
// Instruction = opcode (4 bits) + operand (8 bits). This is the Set 4 program.
module program_rom(
    input [3:0] addr,
    output reg [11:0] instr
);

always @(*) begin
        case (addr)
            4'd0:    instr = 12'h11E;  // LDI 0x1E
            4'd1:    instr = 12'hA00;  // STA
            4'd2:    instr = 12'h222;  // ADD 0x22
            4'd3:    instr = 12'h460;  // AND 0x60
            4'd4:    instr = 12'hB00;  // LDR
				4'd5:    instr = 12'h201;  // ADD 0x01
            4'd6:    instr = 12'h40F;  // AND 0x0F
            4'd7:    instr = 12'hA00;  // STA
            4'd8:    instr = 12'h100;  // LDI 0x00
            4'd9:    instr = 12'hB00;  // LDR
            default: instr = 12'h000;  // unused locations = NOP
				
		 endcase
    end
	 
endmodule