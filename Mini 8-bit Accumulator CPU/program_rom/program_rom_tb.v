`timescale 1ns / 1ps
module program_rom_tb;
    reg [3:0] addr;
    wire [11:0] instr;
    integer i;

    program_rom uut (.addr(addr), .instr(instr));

    initial begin
        // Read all 16 locations. 0-9 hold the program, 10-15 must be 000 (NOP)
        for (i = 0; i < 16; i = i + 1) begin
            addr = i;
            #10;
            $display("addr=%d  instr=%h", addr, instr);
        end
        $finish;
    end
endmodule