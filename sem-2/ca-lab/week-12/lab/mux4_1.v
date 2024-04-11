module mux4_1(sel, inp1, inp2, inp3, inp4, out);

	input [1:0] sel;
	input [31:0] inp1, inp2, inp3, inp4;
	output reg [31:0] out;
	
	always @ (*) begin
		case (sel)
			2'b00: out = inp1;
			2'b01: out = inp2;
			2'b10: out = inp3;
			default: out = inp4;
		endcase
	end
	
endmodule
