`timescale 1ns / 1ps

module ID_EX_tb;

	// Inputs
	reg clk;
	reg [31:0] ReadData1;
	reg [31:0] ReadData2;
	reg [31:0] signExImmediate;
	reg RegDst;
	reg ALUSrc;
	reg MemtoReg;
	reg RegWrite;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg [2:0] ALUOp;
	reg [4:0] rd;
	reg [4:0] rt;
	reg [5:0] funct;
	reg [31:0] nextPC;
	reg hit;

	// Outputs
	wire [31:0] ReadData1Out;
	wire [31:0] ReadData2Out;
	wire [31:0] signExImmediateOut;
	wire RegDstOut;
	wire ALUSrcOut;
	wire MemtoRegOut;
	wire RegWriteOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire [2:0] ALUOpOut;
	wire [4:0] rdOut;
	wire [4:0] rtOut;
	wire [5:0] functOut;
	wire [31:0] nextPCOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	ID_EX uut (
		.clk(clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.SignExtendImmediate(SignExtendImmediate), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp), 
		.rd(rd), 
		.rt(rt), 
		.funct(funct), 
		.nextPC(nextPC), 
		.hit(hit), 
		.ReadData1Out(ReadData1Out), 
		.ReadData2Out(ReadData2Out), 
		.SignExtendImmediateOut(SignExtendImmediateOut), 
		.RegDstOut(RegDstOut), 
		.ALUSrcOut(ALUSrcOut), 
		.MemtoRegOut(MemtoRegOut), 
		.RegWriteOut(RegWriteOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.BranchOut(BranchOut), 
		.ALUOpOut(ALUOpOut), 
		.rdOut(rdOut), 
		.rtOut(rtOut), 
		.functOut(functOut), 
		.nextPCOut(nextPCOut), 
		.hitOut(hitOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ReadData1 = 0;
		ReadData2 = 0;
		signExImmediate = 0;
		RegDst = 0;
		ALUSrc = 0;
		MemtoReg = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		ALUOp = 0;
		rd = 0;
		rt = 0;
		funct = 0;
		nextPC = 0;
		hit = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

