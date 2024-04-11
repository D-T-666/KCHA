module Shifter(Funct, Number, Shift_Amount, Result);

	input [1:0] Funct;
	input [31:0] Number;
	input [4:0] Shift_Amount;
	output reg [31:0] Result;
	
	integer i;

	always @ (*) begin
		case (Funct)
			2'b00: Result = Number << Shift_Amount;
			2'b10: Result = Number >> Shift_Amount;
			2'b11: begin
						Result = Number >> Shift_Amount;
						if (Number[31]) begin
							for (i = 31; i > 31 - Shift_Amount  && i > -1; i = i - 1) begin
								Result[i] = 1;
							end
						end
					 end
		endcase
	end
	
endmodule
	