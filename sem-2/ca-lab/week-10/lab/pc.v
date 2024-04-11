module PC_module (
    input Clock, Reset, S,
    input [31:0] Next_PC, data_addr_in, data_in,
    output [31:0] PC_out, 
    output reg [31:0] Iout, Mout,
    output reg E
);
    reg [31:0] pc;
    reg [31:0] I;
    reg [31:0] memory [0:255];

    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) memory[1] = 32'h0;
    end

    always @(posedge Reset or posedge Clock) begin
        if (Reset) begin
            E = 0;
            pc = 0;
        end else if (!E) begin
            E = 1;
            pc = Next_PC;
            I = memory[pc >> 2];
            Mout = I;
        end else begin
            E = 0;
            if (S) begin
                memory[data_addr_in >> 2] = data_in;
            end else begin
                Mout = memory[data_addr_in >> 2];
            end
            Iout = I;
        end
    end

    assign PC_out = pc;

endmodule