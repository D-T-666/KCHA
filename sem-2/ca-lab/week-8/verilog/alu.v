module CPU_ALU (
    input [31:0] A_input, B_input,
    input [3:0] Cmd,
    input [4:0] Shamt,
    input ALU_enable, sh,
    output reg [32:0] Results,
    output [3:0] NZCV
);
    always @(Cmd or A_input or B_input or ALU_enable or sh or Shamt) begin
        Results = 0;
        if (ALU_enable) begin
            case (Cmd)
                4'h0 : Results[31:0] = A_input | B_input;
                4'h1 : Results[31:0] = A_input & B_input;
                4'h2 : Results[31:0] = A_input ^ B_input;
                4'h3 : Results[31:0] = A_input ^ B_input; // Since bitwise add is same as xor
                4'h4 : Results[31:0] = A_input ^ B_input; // Since bitwise sub is same as xor
                4'h5 : Results[31:0] = B_input ^ A_input; // Since bitwise sub is same as xor
                4'h6 : Results[32:0] = A_input + B_input;
                4'h7 : Results[32:0] = A_input - B_input;
                4'h8 : Results[32:0] = B_input - A_input;
                4'h9 : Results[32:0] = A_input == B_input;
                4'ha : Results[32:0] = A_input != B_input;
                4'hb : Results[32:0] = A_input > B_input;
                4'hc : Results[32:0] = A_input >= B_input;
                4'hd : Results[32:0] = A_input < B_input;
                4'he : Results[32:0] = A_input <= B_input;
                4'hf : if (sh) Results = A_input << Shamt; else Results = A_input >> Shamt;
            endcase
        end
    end

    assign NZCV[0] = Results[32] & (Cmd != 4'hf);
    assign NZCV[1] = Results[32] & (Cmd == 4'hf);
    assign NZCV[2] = (Results[31:0] == 0) & ALU_enable;
    assign NZCV[3] = !Results[32] & (Cmd == 4'h4 | Cmd == 4'h5) | (A_input[31] ^ (~B_input[31]) ^ Results[32]);
    
endmodule