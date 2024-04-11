module delay(clk, E, GP_WE, cad, gpr_out, d_E, d_GP_WE, d_cad, d_gpr_out);

	input clk;

	input E, GP_WE;
	input [31:0] cad, gpr_out;
	
	output reg d_E, d_GP_WE;
	output reg [31:0] d_cad, d_gpr_out;
	
	always @ (posedge clk) begin
		d_E <= E;
		d_GP_WE <= GP_WE;
		d_cad <= cad;
		d_gpr_out <= gpr_out;
	end
	
endmodule
