// 22201064 - Tayaib Rafsun
// 8-bit Full Adder (structural, built from 8x full_adder_1bit)
// Individual bit ports (not buses) so each stage shows separately in the schematic
module full_adder_8bit(
    input  A0, A1, A2, A3, A4, A5, A6, A7,
    input  B0, B1, B2, B3, B4, B5, B6, B7,
    input  Cin,
    output Sum0, Sum1, Sum2, Sum3, Sum4, Sum5, Sum6, Sum7,
    output Cout
);

    // Internal carry wires between stages
    wire c1, c2, c3, c4, c5, c6, c7;
	 
	  // Bit 0
    full_adder_1bit FA0 (.A(A0), .B(B0), .Cin(Cin), .Sum(Sum0), .Cout(c1));

    // Bit 1
    full_adder_1bit FA1 (.A(A1), .B(B1), .Cin(c1), .Sum(Sum1), .Cout(c2));

    // Bit 2
    full_adder_1bit FA2 (.A(A2), .B(B2), .Cin(c2), .Sum(Sum2), .Cout(c3));

    // Bit 3
    full_adder_1bit FA3 (.A(A3), .B(B3), .Cin(c3), .Sum(Sum3), .Cout(c4));

// Bit 4
    full_adder_1bit FA4 (.A(A4), .B(B4), .Cin(c4), .Sum(Sum4), .Cout(c5));

    // Bit 5
    full_adder_1bit FA5 (.A(A5), .B(B5), .Cin(c5), .Sum(Sum5), .Cout(c6));

    // Bit 6
    full_adder_1bit FA6 (.A(A6), .B(B6), .Cin(c6), .Sum(Sum6), .Cout(c7));

    // Bit 7
    full_adder_1bit FA7 (.A(A7), .B(B7), .Cin(c7), .Sum(Sum7), .Cout(Cout));

endmodule