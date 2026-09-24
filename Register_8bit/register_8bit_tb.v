// 22201064 - Tayaib Rafsun
// Testbench for 8-bit Register (D Flip-Flop based)

`timescale 1ns / 1ps
 
module register_8bit_tb;
 
    reg D0, D1, D2, D3, D4, D5, D6, D7;
    reg clk;
 
    wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
 
    register_8bit uut (
        .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .D5(D5), .D6(D6), .D7(D7),
        .clk(clk),
        .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .Q5(Q5), .Q6(Q6), .Q7(Q7)
    );
 
    // Clock generator: 20 ns period (toggles every 10 ns)
    initial clk = 0;
    always #10 clk = ~clk;
 
    // Helper task to load an 8-bit value bit-by-bit into D0-D7
    task set_D(input [7:0] val);
        begin
            D0 = val[0]; D1 = val[1]; D2 = val[2]; D3 = val[3];
            D4 = val[4]; D5 = val[5]; D6 = val[6]; D7 = val[7];
        end
    endtask
 
    initial begin
        set_D(8'h00); #20; // 00000000
        set_D(8'hFF); #20; // 11111111
        set_D(8'hA5); #20; // 10100101
        set_D(8'h3C); #20; // 00111100
        $finish;
    end
 
endmodule
