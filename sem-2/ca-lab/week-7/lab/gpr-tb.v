module gpr_tb();

reg clk;
reg write_enable;
reg [4:0] addrA;
reg [4:0] addrB;
reg [4:0] addrC;
wire [31:0] data_out_A;
wire [31:0] data_out_B;
reg [31:0] data_in_C;

gpr UUT(
    .clk(clk), 
    .write_enable(write_enable), 
    .addrA(addrA),
    .addrB(addrB),
    .addrC(addrC),
    .data_out_A(data_out_A),
    .data_out_B(data_out_B),
    .data_in_C(data_in_C)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("gpr_tb.vcd");
    $dumpvars(0, gpr_tb); 
    clk = 0;
    write_enable = 1;
    addrA = 0; addrB = 1; addrC = 0;
    data_in_C = 3'h768;
    #22;
    addrC = 1;
    data_in_C = 3'h420;
    #20;
    write_enable = 0;
    data_in_C = 1'h0;
    #20;
    addrA = 9;
    #20;
    $finish;
end

endmodule
