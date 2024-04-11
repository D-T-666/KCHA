`timescale 1ns / 1ns

`include "triple_impl.v"

module triple_imple_tb;

    reg A;
    reg B;
    reg C;
    wire X;

    tripple_impl tripple_impl_inst
    (
        A,
        B,
        C,
        X
    );

    initial begin
        $dumpfile("triple_imple_tb.vcd");
        $dumpvars(0,triple_imple_tb);

        A = 0;
        B = 0;
        C = 0;
        #10;
        A = 0;
        B = 1;
        C = 0;
        #10;
        A = 1;
        B = 0;
        C = 0;
        #10;
        A = 1;
        B = 1;
        C = 0;
        #10;
        A = 0;
        B = 0;
        C = 1;
        #10;
        A = 0;
        B = 1;
        C = 1;
        #10;
        A = 1;
        B = 0;
        C = 1;
        #10;
        A = 1;
        B = 1;
        C = 1;
        #10;

        $display("test complete");
    end 

endmodule