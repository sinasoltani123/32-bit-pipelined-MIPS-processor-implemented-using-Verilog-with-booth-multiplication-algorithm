`timescale 1ns / 1ps

module EX_MEM
	(
	input clk,
	input hit,
	input [31:0]branchTarget,
	input zeroFlag,
	input MemRead,
	input MemWrite,
	input Branch,
	input RegWrite,
	input MemToReg,
	input [31:0]ALUResult,
	input [31:0]readData2,
	input [4:0]writeReg,
	
	output reg	[31:0]BranchTargetOut,
	output reg	[31:0]ALUResultOut,
	output reg	[31:0]readData2Out,
	output reg	[4:0]writeRegOut,
	output reg hitOut,
	output reg zeroFlagOut,
	output reg MemReadOut,
	output reg MemWriteOut,
	output reg BranchOut,
	output reg RegWriteOut,
	output reg MemToRegOut
    );

	always@ (negedge clk) begin
		if (hit === 1)begin
			hitOut <= hit;
			BranchTargetOut <= branchTarget;
			zeroFlagOut <= zeroFlag;
			ALUResultOut <= ALUResult;
			readData2Out <= readData2;
			writeRegOut <= writeReg;
			MemReadOut <= MemRead;
			MemWriteOut <= MemWrite;
			BranchOut <= Branch;
			RegWriteOut <= RegWrite;
			MemToRegOut <= MemToReg;
		end
	end
endmodule
