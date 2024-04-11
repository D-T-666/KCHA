module alu_tb();

reg [31:0] A_input;
  reg [31:0] B_input;
  reg [3:0] Cmd;
  reg ALU_enable;
  reg sh;
  reg [4:0] Shamt;
  wire [32:0] Results;
  wire [3:0] NZCV;

  CPU_ALU UUT (
    .A_input(A_input),
    .B_input(B_input),
    .Cmd(Cmd),
    .Shamt(Shamt),
    .ALU_enable(ALU_enable),
    .sh(sh),
    .Results(Results),
    .NZCV(NZCV)
  );

  initial begin
    $dumpfile("alu-tb.vcd"); 
    $dumpvars(0, alu_tb);
    ALU_enable = 1;
    A_input = 32'd11;
    B_input = 32'd7;
    Cmd = 4'b0000;
    #10;
    Cmd = 4'b0001;
    #10;
    Cmd = 4'b0010;
    #10;
    Cmd = 4'b0011;
    #10;
    Cmd = 4'b0100;
    #10;
    Cmd = 4'b0101;
    #10;
    Cmd = 4'b0110;
    #10;
    Cmd = 4'b0111;
    #10;
    Cmd = 4'b1000;
    #10;
    Cmd = 4'b1001;
    #10;
    Cmd = 4'b1010;
    #10;
    Cmd = 4'b1011;
    #10;
    Cmd = 4'b1100;
    #10;
    Cmd = 4'b1101;
    #10;
    Cmd = 4'b1110;
    #10;     
    sh = 1;
    Shamt = 3;
    Cmd = 4'b1111;
    #10;     
  end
endmodule