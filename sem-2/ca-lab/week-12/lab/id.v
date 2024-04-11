module ID (
    input [31:0] Instruction,
    // ALU
    output [3:0] Af,
    output I,
    output ALU_MUX_SEL,
    // GPR
    output [4:0] Cad,
    output GP_WE,
    output [1:0] GP_MUX_SEL, // ALU, MEMORY, SHIFTER, PC
    // BCE
    output [3:0] Bf,
    // MEMORY
    output DM_WE,
    // SHIFTER
    output reg [2:0] Shift_type,
    // PC
    output [1:0] PC_MUX_Select
);

    wire [5:0] opc, fun;
    wire [4:0] rs, rt, rd, sa;
    wire [25:0] iindex;
    wire [25:0] imm;
    wire j, alu;

    assign opc = Instruction[31:26];
    assign fun = Instruction[5:0];
    assign rs = Instruction[25:21];
    assign rt = Instruction[20:16];
    assign rd = Instruction[15:11];
    assign sa = Instruction[10:6];
    assign imm = Instruction[15:0];
    assign iindex = Instruction[25:0];

    assign I = opc != 0;
    assign j = opc == 6'b000010;
    assign ALU_MUX_SEL = ~I;
    assign Cad = rd;

    assign alu = (!I && fun[5:4] == 2'b10) || (I && opc[5:3] == 3'b001);

    assign Af = alu ? ((!I) ? fun[3:0] : {Instruction[27], opc[5:2]}) : 4'b0000;
    assign GP_WE = alu || opc[5:3] == 3'b100 || opc == 6'b000011 || opc[5:3] == 3'b100 || ((!I) && fun == 6'b000010) || ((!I) && fun == 6'b001100);
    assign DM_WE = opc == 6'b101011;
    assign Bf = {opc[2:0], Instruction[16]};
    assign Cad = (opc == 6'b000011) ? 5'b11111 : ((!I) ? rd : rt);
    assign GP_MUX_SEL = {!alu && opc == 6'b100011, !alu && (!I) && fun == 6'b000010};

    assign PC_MUX_Select = {!(!I && (fun == 6'b001000 || fun == 6'b001001)) || !(I && !j && opc[5:3] == 3'b000), !(I && !j && opc[5:3] == 3'b000) && !j};

    always @ (Instruction) begin
        if(!I) begin
            Shift_type <= 3'b000;
            case (fun)
                6'b000: Shift_type <= 1;
                6'b010: Shift_type <= 2;
                6'b011: Shift_type <= 3;
                6'b100: Shift_type <= 4;
                6'b110: Shift_type <= 5;
                6'b111: Shift_type <= 6;
            endcase
        end
    end  
    
endmodule