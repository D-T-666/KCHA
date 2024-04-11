module full_adder (
    A,
    B,
    C_in,
    S,
    C_out
);
    input A;
    input B;
    input C_in;

    output S;
    output C_out;

    wire D;
    wire E;
    wire F;

    // Sum
    assign S = A ^ B ^ C_in;
    
    // Carry
    assign D = B & C_in;
    assign E = A & B;
    assign F = A & C_in;
    assign C_out = D | E | F;

endmodule

//   A  B C_in | S C_out
//   0  0  0   | 0   0
//   0  0  1   | 1   0
//   0  1  0   | 1   0
//   0  1  1   | 0   1
//   1  0  0   | 1   0
//   1  0  1   | 0   1
//   1  1  0   | 0   1
//   1  1  1   | 1   1

// DNF
// S = (~A & ~B & C_in) | (~A & B & ~C_in) | (A & ~B & ~C_in) | (A & B & C_in)
//   = (~A & (~B & C_in | B & ~C_in)) | (A & (~B & ~C_in | B & C_in))
//   = (~A & (B ^ C_in)) | (A & ~(B ^ C_in))
//   = A ^ (B ^ C_in) 
//   = A ^ B ^ C_in

// C_out = (~A & B & C_in) | (A & ~B & C_in) | (A & B & ~C_in) | (A & B & C_in) 
//       = (A & (~B & C_in | B & ~C_in | B & C_in)) | (~A & B & C_in)
//       = (A & (B | C_in)) | (~A & (B & C_in))
//       = (B & C_in) | (A & (B | C_in))
//       = (B & C_in) | (A & B) | (A & C_in)
