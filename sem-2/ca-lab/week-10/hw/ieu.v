module IEU #(
    parameter N = 16, M = 32
) (
    input U,
    input [N-1:0] imm,
    output [M-1:0] res
);
    assign res = U 
    ? imm[15:0]
    : { {(M-N){imm[15]}}, imm[15:0] };
endmodule