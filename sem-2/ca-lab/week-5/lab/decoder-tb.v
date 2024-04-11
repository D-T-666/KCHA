`include "decoder.v"

module decoder_tb();

reg [1:0] in;
wire [3:0] out;

decoder UUT(.in(in), .out(out));

initial begin
    $dumpfile("decoder_tb.vcd");
    $dumpvars(0, decoder_tb);
    in = 2'b00;
    #100;
    in = 2'b01;
    #100;
    in = 2'b10;
    #100;
    in = 2'b11;
    #100;
end

endmodule