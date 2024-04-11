module empi(clk, rst, S, nextPC, addr_in, data_in, PCout, Iout, Mout, E);

	input clk, rst, S;
	input [31:0] nextPC;
	input [31:0] addr_in;
	input [31:0] data_in;
	
	output reg E = 0;
	output reg [31:0] PCout = 0;
	output reg [31:0] Iout;
	output reg [31:0] Mout;
	
	// Initialize Memory from a .txt file
	reg [31:0] memory [0:255];
	initial $readmemb("mem.txt", memory);

	// Update Mout
	always @ (E) begin
		if (!E) Mout = memory[PCout[31:2]];
		else begin
			if (S) memory[addr_in[31:2]] = data_in;
			Mout = memory[addr_in[31:2]];
		end
	end
	
	// Update Iout
	always @ (negedge E) Iout = Mout;
		
	// Change E
	always @ (posedge clk) begin
		if (rst) E = 0;
		else E = ~E;
	end

	// Increment PC
	always @ (posedge rst or posedge E) begin
		if (rst) PCout = 32'b0;
		else PCout = {nextPC[31:2], 2'b00};
	end
	
endmodule
		
		