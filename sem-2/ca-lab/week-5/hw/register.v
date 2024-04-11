module register (
    input reset,
    input load,
    input set,
    input [2:0] data,
    output reg [2:0] out = 0
);

always @(posedge load) begin
    out = data;
end

always @(posedge set) begin
    out = 3'b111;
end

always @(posedge reset) begin
    out = 3'b000;
end

endmodule
