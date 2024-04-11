module mux2_1 #(parameter N = 32, M = 32) (sel, inp1, inp2, out);

	input sel;
	input [N-1:0] inp1, inp2;
	output reg [M-1:0] out;
	
	always @ (*) begin
		case (sel)
			0: out = inp1;
			default: out = inp2;
		endcase
	end
	
endmodule
