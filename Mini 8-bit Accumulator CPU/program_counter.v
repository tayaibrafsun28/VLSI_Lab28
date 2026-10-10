// 22201064 - Tayaib Rafsun
// 4-bit Program Counter: synchronous active-high reset, +1 every clock
// (no JZ in Set 4, so the PC only ever counts up)
module program_counter(
    input CLK,
    input RESET,
    output reg [3:0] PC
);
    always @(posedge CLK) begin
        if (RESET)
            PC <= 4'b0000;
        else
            PC <= PC + 1;
    end
	 
endmodule