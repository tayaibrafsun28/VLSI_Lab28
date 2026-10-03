// 22201064 - Tayaib Rafsun
// 8-bit Subtractor (structural, built from 8x full_adder)
// Computes D = A - B, using two's complement: A + (~B) + 1
module subtractor_8bit(
    input A0, A1, A2, A3, A4, A5, A6, A7,
    input B0, B1, B2, B3, B4, B5, B6, B7,
    output D0, D1, D2, D3, D4, D5, D6, D7,
    output Bout   // Bout = 1 means no borrow (A >= B); Bout = 0 means borrow occurred (A < B)
);

    wire nb0, nb1, nb2, nb3, nb4, nb5, nb6, nb7;
    assign nb0 = ~B0;
    assign nb1 = ~B1;
    assign nb2 = ~B2;
    assign nb3 = ~B3;
    assign nb4 = ~B4;
    assign nb5 = ~B5;
    assign nb6 = ~B6;
    assign nb7 = ~B7;
	 
	 
	  wire c1, c2, c3, c4, c5, c6, c7;

    full_adder FA0 (.A(A0), .B(nb0), .Cin(1'b1), .Sum(D0), .Cout(c1));
    full_adder FA1 (.A(A1), .B(nb1), .Cin(c1),   .Sum(D1), .Cout(c2));
    full_adder FA2 (.A(A2), .B(nb2), .Cin(c2),   .Sum(D2), .Cout(c3));
    full_adder FA3 (.A(A3), .B(nb3), .Cin(c3),   .Sum(D3), .Cout(c4));
	 full_adder FA4 (.A(A4), .B(nb4), .Cin(c4),   .Sum(D4), .Cout(c5));
    full_adder FA5 (.A(A5), .B(nb5), .Cin(c5),   .Sum(D5), .Cout(c6));
    full_adder FA6 (.A(A6), .B(nb6), .Cin(c6),   .Sum(D6), .Cout(c7));
    full_adder FA7 (.A(A7), .B(nb7), .Cin(c7),   .Sum(D7), .Cout(Bout));

endmodule