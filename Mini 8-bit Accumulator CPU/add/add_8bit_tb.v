`timescale 1ns / 1ps
module add_8bit_tb;
    reg A0,A1,A2,A3,A4,A5,A6,A7;
    reg B0,B1,B2,B3,B4,B5,B6,B7;
    wire S0,S1,S2,S3,S4,S5,S6,S7;
    wire Cout;

    add_8bit uut (
        .A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),
        .B0(B0),.B1(B1),.B2(B2),.B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),
        .S0(S0),.S1(S1),.S2(S2),.S3(S3),.S4(S4),.S5(S5),.S6(S6),.S7(S7),
        .Cout(Cout)
    ); 
	 
	 task set_A(input [7:0] v);
        begin A0=v[0];A1=v[1];A2=v[2];A3=v[3];A4=v[4];A5=v[5];A6=v[6];A7=v[7]; end
    endtask
	 
    task set_B(input [7:0] v);
        begin B0=v[0];B1=v[1];B2=v[2];B3=v[3];B4=v[4];B5=v[5];B6=v[6];B7=v[7]; end
    endtask
	 
	 initial begin
        $monitor("t=%0t  A=%0d B=%0d | Sum=%0d Cout=%b", $time,
                 {A7,A6,A5,A4,A3,A2,A1,A0}, {B7,B6,B5,B4,B3,B2,B1,B0},
                 {S7,S6,S5,S4,S3,S2,S1,S0}, Cout);
        set_A(8'd0);   set_B(8'd0);   #20;  // 0+0     = 0
        set_A(8'd15);  set_B(8'd10);  #20;  // 15+10   = 25
        set_A(8'd100); set_B(8'd27);  #20;  // 100+27  = 127
		  set_A(8'd200); set_B(8'd100); #20;  // 300     -> Sum=44,  Cout=1
        set_A(8'd255); set_B(8'd1);   #20;  // 256     -> Sum=0,   Cout=1
		  
        $finish;
		  
    end
endmodule