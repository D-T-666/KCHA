module divider (
    input clock,
    input reset,
    output reg out = 0
);

reg A = 0;
reg B = 0;
reg F = 0;

always @(clock, posedge reset) begin
    if (~reset) begin
        A <= F & (A ^ B);
        B <= F & ~(A & B);
        out <= F & (out ^ (A & B));
        F <= ~reset;
    end else begin
        A <= 0;
        B <= 0;
        F <= 0;
        out <= 0;
    end
end

endmodule