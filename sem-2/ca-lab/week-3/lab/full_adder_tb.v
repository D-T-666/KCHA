`timescale 1ns / 1ns

`include "full_adder.v"

module full_adder_tb;

    reg A;
    reg B;
    reg C_in;
    wire S;
    wire C_out;

    full_adder full_adder_inst
    (
        A,
        B,
        C_in,
        S,
        C_out
    );

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0,full_adder_tb);

        A = 0;
        B = 0;
        C_in = 0;
        #10;
        A = 0;
        B = 1;
        C_in = 0;
        #10;
        A = 1;
        B = 0;
        C_in = 0;
        #10;
        A = 1;
        B = 1;
        C_in = 0;
        #10;
        A = 0;
        B = 0;
        C_in = 1;
        #10;
        A = 0;
        B = 1;
        C_in = 1;
        #10;
        A = 1;
        B = 0;
        C_in = 1;
        #10;
        A = 1;
        B = 1;
        C_in = 1;
        #10;

        $display("test complete");
    end 

endmodule