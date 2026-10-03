// 22201064 - Tayaib Rafsun
// 8-bit bitwise NOT (operates on A only)
module not_8bit(
    input A0, A1, A2, A3, A4, A5, A6, A7,
    output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);
    assign Y0 = ~A0;
    assign Y1 = ~A1;
    assign Y2 = ~A2;
    assign Y3 = ~A3;
    assign Y4 = ~A4;
    assign Y5 = ~A5;
    assign Y6 = ~A6;
    assign Y7 = ~A7;
	 
endmodule