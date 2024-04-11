`include "rom.v"

module rom_tb();

reg [2:0] addr;
reg sel;
wire [7:0] data;

rom UUT(.address(addr), .sel(sel), .data(data));

initial begin
    $dumpfile("rom_tb.vcd");
    $dumpvars(0, rom_tb);
    addr = 0;
    sel = 0;
    #5; sel = 1;
    #5; addr = 1;
    #5; addr = 2;
    #5; addr = 3;
    #5; addr = 4;
    #5; sel = 0;
    #5; sel = 1;
    #5; addr = 5;
    #5; addr = 6;
    #5; addr = 7;
    #5;
    $finish;
end

endmodule