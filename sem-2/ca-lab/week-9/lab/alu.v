module ALU (
    input i,
    input [31:0] SrcA, SrcB,
    input [3:0] af,
    output reg [31:0] Alures,
    output Zero, Neg, ovfalu
);
    always @(af or i or SrcA or SrcB) begin
        case (af)
            4'b0000 : Alures = SrcA + SrcB ;
            4'b0001 : Alures = SrcA + SrcB ;
            4'b0010 : Alures = SrcA - SrcB ;
            4'b0011 : Alures = SrcA - SrcB ;
            4'b0100 : Alures = SrcA & SrcB ;
            4'b0101 : Alures = SrcA | SrcB ;
            4'b0110 : Alures = SrcA ^ SrcB ;
            4'b0111 : Alures = i ? SrcB << 16 : SrcA ~| SrcB;
            4'b1010 : Alures = (SrcA[31] ^ SrcB[31]) ? SrcA[30:0] < SrcB[30:0] : SrcA[31] ;
            4'b1011 : Alures = SrcA < SrcB ;
        endcase
    end
    assign Zero = Alures == 0;
    assign Neg = (af < 4) & Alures[31];
    assign ovfalu = (af == 0 | af == 2) & (Alures[31] ? (SrcA[31] & SrcB[31]) : (SrcA[31] | SrcB[31]));
endmodule

 