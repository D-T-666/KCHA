`include "mux.v"

module mux_tb();

reg [3:0] a;
reg [3:0] b;
reg [3:0] c;
reg [3:0] d;
reg [1:0] sel;
wire [3:0] out;

mux UUT(.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));

initial begin
    $dumpfile("mux_tb.vcd");
    $dumpvars(0,mux_tb);
    sel = 0; a = 0; b = 1; c = 2; d = 3;
    #100;
    sel = 1; a = 0; b = 1; c = 2; d = 3;
    #100;
    sel = 2; a = 0; b = 1; c = 2; d = 3;
    #100;
    sel = 3; a = 0; b = 1; c = 2; d = 3;
    #100;
end

endmodule