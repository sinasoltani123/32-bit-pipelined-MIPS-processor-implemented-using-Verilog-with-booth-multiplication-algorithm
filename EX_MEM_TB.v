`timescale 1ns / 1ps


module EX_MEM_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg RegWrite;
	reg MemToReg;
	reg [31:0] ALUResult;
	reg [31:0] readData2;
	reg [4:0] writeReg;

	// Outputs
	wire [31:0] BranchTargetOut;
	wire [31:0] ALUResultOut;
	wire [31:0] readData2Out;
	wire [4:0] writeRegOut;
	wire hitOut;
	wire zeroFlagOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire RegWriteOut;
	wire MemToRegOut;

	// Instantiate the Unit Under Test (UUT)
	EX_MEM uut (
		.clk(clk), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.ALUResult(ALUResult), 
		.readData2(readData2), 
		.writeReg(writeReg), 
		.BranchTargetOut(BranchTargetOut), 
		.ALUResultOut(ALUResultOut), 
		.readData2Out(readData2Out), 
		.writeRegOut(writeRegOut), 
		.hitOut(hitOut), 
		.zeroFlagOut(zeroFlagOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.BranchOut(BranchOut), 
		.RegWriteOut(RegWriteOut), 
		.MemToRegOut(MemToRegOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		hit = 0;
		branchTarget = 0;
		zeroFlag = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		RegWrite = 0;
		MemToReg = 0;
		ALUResult = 0;
		readData2 = 0;
		writeReg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

