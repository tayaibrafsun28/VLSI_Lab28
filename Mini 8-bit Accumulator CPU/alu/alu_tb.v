`timescale 1ns / 1ps
module alu_tb;
    reg [7:0] acc, operand;
    reg [1:0] alu_op;
    wire [7:0] result;

    alu uut (.acc(acc), .operand(operand), .alu_op(alu_op), .result(result));

    initial begin
        $monitor("t=%0t  alu_op=%b acc=%h operand=%h | result=%h",
                 $time, alu_op, acc, operand, result);
        
		  
		  // LDI: result = operand
		  alu_op = 2'b00; acc = 8'h55; operand = 8'h1E; #10;  // 1E
        alu_op = 2'b00; acc = 8'hFF; operand = 8'h00; #10;  // 00
        // ADD
        alu_op = 2'b01; acc = 8'h1E; operand = 8'h22; #10;  // 40
        alu_op = 2'b01; acc = 8'h1E; operand = 8'h01; #10;  // 1F
        alu_op = 2'b01; acc = 8'hFF; operand = 8'h01; #10;  // 00 (carry discarded)
        // AND
		  alu_op = 2'b10; acc = 8'h40; operand = 8'h60; #10;  // 40
        alu_op = 2'b10; acc = 8'h1F; operand = 8'h0F; #10;  // 0F
        alu_op = 2'b10; acc = 8'hAA; operand = 8'h55; #10;  // 00
        $finish;
		  
    end
endmodule