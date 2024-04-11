`include "divider.v"

module divider_tb();

reg clock;
reg reset;
wire out;

divider UUT(.clock(clock), .reset(reset), .out(out));

always #2 clock = ~clock;

initial begin
    $dumpfile("divider_tb.vcd");
    $dumpvars(0, divider_tb); 
    clock = 0;
    reset = 0;
    #20;
    reset = 1;
    #19;
    reset = 0;
    #20;
    $finish;
end

endmodule