// Tayaib Rafsun - 22201064
// 1-bit Full Adder

module full_adder_1bit(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    // Sum = XOR of all three inputs
    assign Sum = A ^ B ^ Cin;

    // Cout = 1 if at least two inputs are 1
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule