`timescale 1ns / 1ns

`include "half_adder.v"

module half_adder_tb;

    reg A;
    reg B;
    wire w_SUM;
    wire w_CARRY;

    half_adder half_adder_inst
    (
        A,
        B,
        w_SUM,
        w_CARRY
    );

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0,half_adder_tb);

        A = 0;
        B = 0;
        #10;
        A = 0;
        B = 1;
        #10;
        A = 1;
        B = 0;
        #10;
        A = 1;
        B = 1;
        #10;

        $display("test complete");
    end 

endmodule