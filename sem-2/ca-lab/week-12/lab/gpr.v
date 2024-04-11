module GPR (
    input clk,
    input WE,
    input [4:0] addrA,
    input [4:0] addrB,
    input [4:0] addrC,
    output reg [31:0] data_out_A,
    output reg [31:0] data_out_B,
    input [31:0] data_in_C
);

reg [31:0] register [0:31];
integer i;

initial begin
    $readmemb("mem.txt", register);
end

always @(posedge clk) begin
    if (WE) begin
        if (addrC != 0) begin
            register[addrC] <= data_in_C;

            if (addrC == addrA)
                data_out_A <= data_in_C;

            if (addrC == addrB)
                data_out_B <= data_in_C;
        end
    end
end

always @(addrA)
    data_out_A <= register[addrA];

always @(addrB)
    data_out_B <= register[addrB];

endmodule
