module IEU #(parameter N = 4, M = 32) (
		input U,
		input  [N - 1:0] immediateIn,
		output [M - 1:0] immediateOut
	);
	
	reg [M-N:0] ext = (2**(M-N));
	
	always @ (*) begin 
		if (U && ext[0]) ext = ext + 1;
		else if (!U) begin
			if (immediateIn[N-1] && !ext[0]) ext = ext - 1;
			else if (!immediateIn[N-1] && ext[0]) ext = ext + 1;
		end
	end
	
	assign immediateOut = {ext, immediateIn};
	
endmodule
