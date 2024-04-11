module incrementedPC (pcin, imm, out);

	input [31:0] pcin;
	input [25:0] imm;
	
	reg [31:0] temp;
	
	output reg [31:0] out;
	
	always @ (*) begin
		temp = pcin + 4;
		out = {temp, imm, 2'b00};
	end
	
endmodule
