// 22201064 - Tayaib Rafsun
//8 bit register using D flip flop

module register_8bit(
    // 8 input
    input D0,
    input D1,
    input D2,
    input D3,
    input D4,
    input D5,
    input D6,
    input D7,
 
    input clk,
 
    //8 output
    output Q0,
    output Q1,
    output Q2,
    output Q3,
    output Q4,
    output Q5,
    output Q6,
    output Q7
);
 
    // 1st bit (Bit 0)
    register_1bit REG0 (.D(D0), .clk(clk), .Q(Q0));
 
    // 2nd bit (Bit 1)
    register_1bit REG1 (.D(D1), .clk(clk), .Q(Q1));
 
    // 3rd bit (Bit 2)
    register_1bit REG2 (.D(D2), .clk(clk), .Q(Q2));
 
    // 4th bit (Bit 3)
    register_1bit REG3 (.D(D3), .clk(clk), .Q(Q3));
 
    // 5th bit (Bit 4)
    register_1bit REG4 (.D(D4), .clk(clk), .Q(Q4));
 
    // 6th bit (Bit 5)
    register_1bit REG5 (.D(D5), .clk(clk), .Q(Q5));
 
    // 7th bit (Bit 6)
    register_1bit REG6 (.D(D6), .clk(clk), .Q(Q6));
 
    // 8th bit (Bit 7)
    register_1bit REG7 (.D(D7), .clk(clk), .Q(Q7));
 
endmodule
