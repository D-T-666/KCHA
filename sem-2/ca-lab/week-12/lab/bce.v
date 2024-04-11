module BCE(SrcA, SrcB, BF, bcres);

	input signed [31:0] SrcA, SrcB;
	input [3:0] BF;
	output reg bcres;	
	
	always @ (*) begin
		if (BF == 4'b0010) bcres = SrcA < 0;
		else if (BF == 4'b0011) bcres = SrcA >= 0;
		else if (BF >= 4'b1110) bcres = SrcA > 0;
		else if (BF >= 4'b1100) bcres = SrcA <= 0;
		else if (BF >= 4'b1010) bcres = SrcA != SrcB;
		else if (BF >= 4'b1000) bcres = SrcA == SrcB;
	end

endmodule
