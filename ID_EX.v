`timescale 1ns / 1ps

module ID_EX
	(
	input clk, 
	input hit,
	input [31:0]ReadData1,
	input [31:0]ReadData2,
	input [31:0]SignExtendImmediate,
	input RegDst,
	input ALUSrc, 
	input MemtoReg,
	input RegWrite,
	input MemRead,
	input MemWrite,
	input Branch,
	input [2:0]ALUOp,
	input[4:0] rd,
	input[4:0] rt,
	input [5:0]funct, 
	input [31:0]nextPC,
	
	output reg hitOut,
	output reg[31:0]ReadData1Out,
	output reg [31:0]ReadData2Out,
	output reg [31:0]SignExtendImmediateOut,
	output reg RegDstOut,
	output reg ALUSrcOut, 
	output reg MemtoRegOut, 
	output reg RegWriteOut,
	output reg MemReadOut,
	output reg MemWriteOut,
	output reg BranchOut, 
	output reg [2:0]ALUOpOut,
	output reg[4:0]rdOut,
	output reg[4:0]rtOut,
	output reg[5:0]functOut,
	output reg[31:0]nextPCOut
);

	always@(hit) begin
			hitOut = hit;
	end
    
	always@(negedge clk) begin
		if(hit) begin
		
			ReadData1Out <= ReadData1;
			ReadData2Out <= ReadData2;
			SignExtendImmediateOut <= SignExtendImmediate;
			
			functOut <= funct;	
			ALUSrcOut <= ALUSrc;
			RegDstOut <= RegDst;
			
			MemtoRegOut <= MemtoReg;
			RegWriteOut <= RegWrite;
			MemReadOut <= MemRead;
			MemWriteOut <= MemWrite;
			
			nextPCOut <= nextPC;
			BranchOut <= Branch;
			ALUOpOut <= ALUOp;
			rdOut <= rd;
			rtOut <= rt;
		
		end
		
	end
	
	

endmodule
