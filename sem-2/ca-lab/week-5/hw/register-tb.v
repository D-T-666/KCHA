`include "register.v"

module register_tb();

reg clock;
reg reset;
reg load;
reg set;
reg [2:0] data;
wire [2:0] out;

register UUT(.reset(reset), .load(load), .set(set), .data(data), .out(out));

initial begin
    $dumpfile("register_tb.vcd");
    $dumpvars(0, register_tb);
    load = 0;
    reset = 0;
    set = 0;
    data = 3'b010;
    #10;
    load = 1;
    #10;
    load = 0;
    #10;
    reset = 1;
    #10;
    reset = 0;
    #10;
    set = 1;
    #10;
    set = 0;
    #10;
    data = 3'b110;
    #4;
    load = 1;
    #4;
    load = 0;
    #4;
    load = 1;
    #4;
    load = 0;
    #40; $finish;
end

endmodule