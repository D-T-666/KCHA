module combine(); 
 module top(clk, rst);
	
	// MEMORY_MODULE 
	input clk, rst;
	wire E;
	wire [31:0] PCout;
	wire [31:0] Iout;
	wire [31:0] Mout;
	
	// I_DECODER //
	wire [3:0] af;
	wire i, ALU_MUX_SEL;
	wire [4:0] cad;
	wire GP_WE;
	wire [1:0] GP_MUX_SEL;
	wire [3:0] bf;
	wire DM_WE;
	wire [2:0] Shift_type;
	wire [1:0] PC_MUX_SEL;
	
	wire [31:0] RS;
	wire [31:0] RT;
	
	wire [31:0] Alures;
	wire ovfalu;
	
	wire [31:0] Shift_result;
	
	wire bcres;
	
	wire [31:0] tempinp;
	
	wire [31:0] nextPC;
	
	wire [31:0] branch;
	
	wire [31:0] pcBCE;
	
	wire [31:0] gpr_out;
	
	wire d_E, d_GP_WE;
	wire [31:0] d_cad, d_gpr_out;
	
	wire [31:0] alu_out;
	
	wire [31:0] alu_mux_out;
		
	wire [4:0] shifter_mux;
	
	