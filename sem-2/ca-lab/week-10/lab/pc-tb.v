module pc_tb();
	reg Clock;
	reg Reset;
	reg S;
	reg [31:0] Next_PC, data_addr_in, data_in;
	wire E;
	wire [31:0] PC_out, Iout, Mout;

	PC_module UUT (
		.Clock(Clock),
		.Reset(Reset),
		.S(S),
		.Next_PC(Next_PC),
		.data_addr_in(data_addr_in),
		.data_in(data_in),
		.E(E),
		.PC_out(PC_out),
		.Iout(Iout),
		.Mout(Mout)
	);

	always #5 Clock = ~Clock;

	initial begin
		$dumpfile("pc-tb.vcd"); 
		$dumpvars(0, pc_tb);
		Clock = 0;
		Reset = 1;
		S = 0;
		Next_PC = 32'h0;
		data_addr_in = 32'h0;
		data_in = 32'h0;

		#10;
		Reset = 0;

		#10;
		Next_PC = 32'h4;
		S = 1;
		data_addr_in = 32'h8;
		data_in = 32'h12345678;

		#30; 
		Next_PC = 32'h8; 
		S = 0; 
		data_addr_in = 32'h8;
		data_in = 32'h9abcdef0;

		#10; 
		$finish;
	end
endmodule