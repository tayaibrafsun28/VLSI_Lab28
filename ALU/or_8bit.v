// 22201064 - Tayaib Rafsun
// 8-bit bitwise OR
module or_8bit(
    input A0, A1, A2, A3, A4, A5, A6, A7,
    input B0, B1, B2, B3, B4, B5, B6, B7,
    output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);
    assign Y0 = A0 | B0;
    assign Y1 = A1 | B1;
    assign Y2 = A2 | B2;
    assign Y3 = A3 | B3;
    assign Y4 = A4 | B4;
    assign Y5 = A5 | B5;
    assign Y6 = A6 | B6;
    assign Y7 = A7 | B7;
	 
endmodule