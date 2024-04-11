module mux (
    input Z,
    input X,
    input Y,
    output D,
    output B);

assign D = Z ^ X ^ Y;
assign B = (~(X ^ Y) & Z) | (~X & Y);

endmodule