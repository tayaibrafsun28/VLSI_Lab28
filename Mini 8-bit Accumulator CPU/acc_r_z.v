// 22201064 - Tayaib Rafsun
// ACC (8-bit), R (8-bit) and Z (1-bit flag).
// All clocked on the rising edge of CLK with synchronous active-high RESET.
//   RESET : ACC = 0, R = 0, Z = 1
//   acc_we: ACC takes the ALU result (or R when sel_r = 1, for LDR), Z = 1 if that value is 0x00
//   r_we  : R takes the current ACC (STA); Z is NOT changed by STA

module acc_r_z(
    input CLK,
    input RESET,
    input [7:0] alu_result,
    input sel_r,
    input acc_we,
    input r_we,
    output reg [7:0] ACC,
    output reg [7:0] R,
    output reg Z
);

// Value that will be written into ACC: from R (LDR) or from the ALU
    wire [7:0] acc_next;
    assign acc_next = sel_r ? R : alu_result;

    always @(posedge CLK) begin
        if (RESET) begin
            ACC <= 8'h00;
            R   <= 8'h00;
            Z   <= 1'b1;
        end
        else begin
            if (acc_we) begin
                ACC <= acc_next;
                Z   <= (acc_next == 8'h00);
            end
            if (r_we)
                R <= ACC;
        end
    end
	 
endmodule