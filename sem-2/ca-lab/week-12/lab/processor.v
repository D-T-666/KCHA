module Processor (
    input Clock,
    input Reset,
    output reg [31:0] aluresout, shift_resultout, GP_DATA_INout
);

    wire [31:0] PC, I, data_in, data_out;
    wire [31:0] Instruction, SrcA, SrcB;
    wire [31:0] Mout;
    wire [31:0] alu_result, shift_result, immediate_out;
    wire [31:0] data_out_A, data_out_B;
    wire [3:0] af, bf;
    wire i, ALU_MUX_SEL, GP_WE_Org, DM_WE, bcres;
    wire [2:0] shift_type;
    wire [1:0] GP_MUX_SEL, PC_MUX_Select;
    wire [4:0] Cad;
	wire E;
    wire [31:0] next_SrcA;
    reg [31:0] next_PC;
	reg [31:0] next_SrcB;
    reg GP_WE;

    ID ID (
        .Instruction(I),
        .I(i), 
        .ALU_MUX_SEL(ALU_MUX_SEL), 
        .GP_WE(GP_WE_Org), 
        .DM_WE(DM_WE),
        .Af(af), 
        .Bf(bf),
        .Shift_type(shift_type),
        .GP_MUX_SEL(GP_MUX_SEL), 
        .PC_MUX_Select(PC_MUX_Select),
        .Cad(Cad)
    );

    ALU ALU (
        .SrcA(next_SrcA), 
        .SrcB(next_SrcB), 
        .af(af), 
        .i(i), 
        .Alures(alu_result)
    );

    IEU IEU (
        .U(i), 
        .imm(data_in[15:0]), 
        .res(immediate_out)
    );

    BCE BCE (
        .SrcA(SrcA), 
        .SrcB(SrcB), 
        .BF(bf), 
        .bcres(bcres)
    );

    Shifter S (
        .Funct(shift_type[1:0]), 
        .Number(SrcA), 
        .Shift_Amount(SrcB[4:0]), 
        .Result(shift_result)
    );

    GPR GP (
        .clk(Clock),
        .WE(GP_WE),
        .addrA(Instruction[25:21]),
        .addrB(Instruction[20:16]),
        .addrC(Cad),
        .data_in_C(GP_DATA_INout),
        .data_out_A(data_out_A),
        .data_out_B(data_out_B)
    );

    Memory M (
        .Clock(Clock),
        .Reset(Reset),
        .S(DM_WE),
        .Next_PC(next_PC),
        .data_addr_in(GP_DATA_INout),
        .data_in(data_out_A),
        .PC_out(PC),
        .Iout(I),
        .Mout(Mout),
		.E(E)
    );

    always @* begin
        case(ALU_MUX_SEL)
            1'b0: next_SrcB = data_out_B;
            1'b1: next_SrcB = immediate_out;
        endcase
    end

    always @* begin
        case(GP_MUX_SEL)
            2'b00: GP_DATA_INout = alu_result;
            2'b01: GP_DATA_INout = shift_result;
            2'b10: GP_DATA_INout = Mout;
            default: GP_DATA_INout = next_PC;
        endcase
    end

    assign next_SrcA = data_out_A;

    always @(posedge Clock) begin
        if (Reset) begin
            next_PC <= 32'b0;
            GP_WE <= 1'b0;
        end else begin
            GP_WE <= GP_WE_Org & E;
            case(PC_MUX_Select)
                2'b00: next_PC <= PC + 4;
                2'b01: next_PC <= PC + (immediate_out << 2);
                2'b10: next_PC <= data_out_A; 
                2'b11: next_PC <= (bcres) ? PC + (immediate_out << 2) : PC + 4;
            endcase
        end
    end
endmodule