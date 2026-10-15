`timescale 1ns / 1ps
module and_8bit_tb;
    reg A0,A1,A2,A3,A4,A5,A6,A7;
    reg B0,B1,B2,B3,B4,B5,B6,B7;
    wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;

    and_8bit uut (
        .A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),
        .B0(B0),.B1(B1),.B2(B2),.B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),
        .Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6),.Y7(Y7)
    );
	 
	 task set_A(input [7:0] v);
        begin A0=v[0];A1=v[1];A2=v[2];A3=v[3];A4=v[4];A5=v[5];A6=v[6];A7=v[7]; end
    endtask
    task set_B(input [7:0] v);
        begin B0=v[0];B1=v[1];B2=v[2];B3=v[3];B4=v[4];B5=v[5];B6=v[6];B7=v[7]; end
    endtask
	 
	 initial begin
        $monitor("t=%0t  A=%b B=%b | Y=%b", $time,
                 {A7,A6,A5,A4,A3,A2,A1,A0}, {B7,B6,B5,B4,B3,B2,B1,B0},
                 {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0});
        set_A(8'hFF); set_B(8'h0F); #20;  // 0F
        set_A(8'hAA); set_B(8'h55); #20;  // 00
        set_A(8'hF0); set_B(8'h3C); #20;  // 30
        set_A(8'hFF); set_B(8'hFF); #20;  // FF
        set_A(8'h1F); set_B(8'h0F); #20;  // 0F
        $finish;
		  
		   end
endmodule