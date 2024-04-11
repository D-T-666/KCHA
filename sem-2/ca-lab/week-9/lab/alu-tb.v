module alu_tb();

	reg i;
	reg [31:0] SrcA;
	reg [31:0] SrcB;
	reg [3:0] af;
	wire [31:0] Alures;
	wire Zero;
	wire Neg;
	wire ovfalu;

	ALU UUT (
		.i(i),
		.SrcA(SrcA),
		.SrcB(SrcB),
		.af(af),
		.Alures(Alures),
		.Zero(Zero),
		.Neg(Neg),
		.ovfalu(ovfalu)
	);

	initial begin
		$dumpfile("alu-tb.vcd"); 
		$dumpvars(0, alu_tb);
		SrcA = 32'd3;
		SrcB = 32'd4;
		i = 1;
		af = 4'b0000;
		#10;
		af = 4'b0001;
		#10;
		af = 4'b0010;
		#10;
		af = 4'b0011;
		#10;
		af = 4'b0100;
		#10;
		af = 4'b0101;
		#10;
		af = 4'b0110;
		#10;
		af = 4'b0111;
		#10;
		af = 4'b1010;
		#10;
		af = 4'b1011;
		#10;
		i = 0;
		af = 4'b0000;
		#10;
		af = 4'b0001;
		#10;
		af = 4'b0010;
		#10;
		af = 4'b0011;
		#10;
		af = 4'b0100;
		#10;
		af = 4'b0101;
		#10;
		af = 4'b0110;
		#10;
		af = 4'b0111;
		#10;
		af = 4'b1010;
		#10;
		af = 4'b1011;
		#10;     
	end
endmodule