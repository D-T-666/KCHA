module rom (
    input [2:0] address, 
    input sel,
    output reg [7:0] data
);

always @ (sel or address) begin
    if (~sel)
        data = 8'd00;
    else begin
        case (address)
            0: data = 8'd01;
            1: data = 8'd02;
            2: data = 8'd03;
            3: data = 8'd04;
            4: data = 8'd60;
            5: data = 8'd42;
            6: data = 8'd37;
            7: data = 8'd22;
        endcase
    end
end

endmodule