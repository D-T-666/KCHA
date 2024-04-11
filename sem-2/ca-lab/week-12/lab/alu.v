module ALU(i, SrcA, SrcB, af, Alures, ovfalu);

	input i;
	input [31:0] SrcA;
	input [31:0] SrcB;
	input [3:0] af;
	
	output reg [31:0] Alures;
	output reg ovfalu;
		
	always @ (*) begin
		case (af) 
			4'b0000: Alures = SrcA + SrcB;
			4'b0001: Alures = SrcA + SrcB;
			4'b0010: Alures = SrcA - SrcB;
			4'b0011: Alures = SrcA - SrcB;
			4'b0100: Alures = SrcA & SrcB;
			4'b0101: Alures = SrcA | SrcB;
			4'b0110: Alures = SrcA ^ SrcB;
			4'b0111: Alures = i == 1 ? SrcB << 16 : SrcA |~ SrcB;
			4'b1010: Alures = SrcA < SrcB ? 1 : 0;
			4'b1011: Alures = SrcA < SrcB ? 1 : 0;
		endcase
		ovfalu = Alures[31] && (af == 0 || af == 2);
	end

		
endmodule
