`timescale 1ns / 1ps
module acc_r_z_tb;
    reg CLK, RESET;
    reg [7:0] alu_result;
    reg sel_r, acc_we, r_we;
    wire [7:0] ACC, R;
    wire Z;

    acc_r_z uut (.CLK(CLK), .RESET(RESET), .alu_result(alu_result),
                 .sel_r(sel_r), .acc_we(acc_we), .r_we(r_we),
                 .ACC(ACC), .R(R), .Z(Z));

    initial CLK = 0;
    always #5 CLK = ~CLK;
	 
	 
    initial begin
	 
        // Reset: ACC=00, R=00, Z=1
        RESET = 1; alu_result = 8'h00; sel_r = 0; acc_we = 0; r_we = 0;
        @(posedge CLK); @(posedge CLK); #1;
        $display("RESET     : ACC=%h R=%h Z=%b   (expect 00 00 1)", ACC, R, Z);

        // Load 0x1E into ACC
        RESET = 0; alu_result = 8'h1E; acc_we = 1;
        @(posedge CLK); #1;
        $display("Load 1E   : ACC=%h R=%h Z=%b   (expect 1E 00 0)", ACC, R, Z);
		  
		  // STA: R <- ACC, ACC and Z unchanged
        acc_we = 0; r_we = 1;
        @(posedge CLK); #1;
        $display("STA       : ACC=%h R=%h Z=%b   (expect 1E 1E 0)", ACC, R, Z);

        // Load 0x00 into ACC: Z becomes 1
        r_we = 0; alu_result = 8'h00; acc_we = 1;
        @(posedge CLK); #1;
        $display("Load 00   : ACC=%h R=%h Z=%b   (expect 00 1E 1)", ACC, R, Z);
		  
		  // LDR: ACC <- R
        alu_result = 8'hFF; sel_r = 1; acc_we = 1;
        @(posedge CLK); #1;
        $display("LDR       : ACC=%h R=%h Z=%b   (expect 1E 1E 0)", ACC, R, Z);

        // No enables: everything must hold
        sel_r = 0; acc_we = 0; r_we = 0; alu_result = 8'hAA;
        @(posedge CLK); #1;
        $display("Hold (NOP): ACC=%h R=%h Z=%b   (expect 1E 1E 0)", ACC, R, Z);

        $finish;
    end
endmodule

