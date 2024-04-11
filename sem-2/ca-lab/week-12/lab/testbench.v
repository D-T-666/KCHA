module testbench();

	reg clock = 0;
	reg reset = 0;
	wire [31:0] aluresout, shift_resultout, GP_DATA_INout;
	
	Processor UUT (
		.Clock(clock),
		.Reset(reset),
		.aluresout(aluresout),
		.shift_resultout(shift_resultout),
		.GP_DATA_INout(GP_DATA_INout)
	);
	
	always #10 clock = ~clock;
	
	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, testbench);
		#10;
		reset = 1;
		#10;
		reset = 0;
		#100;
		$finish;
	end
	
endmodule
