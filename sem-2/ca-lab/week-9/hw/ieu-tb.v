module ieu_tb();

    reg U;
    reg [15:0] imm;
    wire [31:0] res;

	IEU #(.N(16), .M(32)) UUT (
        .U(U),
        .imm(imm),
        .res(res)
	);

	initial begin
		$dumpfile("ieu-tb.vcd"); 
		$dumpvars(0, ieu_tb);
        U = 0;
        imm = 3;
		#10;
        imm = 16'b1010101010101010;
        #10;
        U = 1;
        #10;
        imm = 3;
        #10;
	end
endmodule