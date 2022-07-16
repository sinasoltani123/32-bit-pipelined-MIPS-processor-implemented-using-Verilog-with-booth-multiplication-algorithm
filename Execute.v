`timescale 1ns / 1ps

module Execute
	(
	input clk,
	input [31:0]AluReadData1,
	input [31:0]AluReadData2,
	input [31:0] Immediate,
	
	input [5:0]funct, 
	input [2:0]ALUOp,
	input ALUSrc, 
	
	output [31:0]ALUResult,
	output Zero
	);
	
	wire [31:0]input2;
	wire [3:0]ALUCnt;
	
	mux Mux (
		.inp1(AluReadData2), 
		.inp2(Immediate), 
		.select(ALUSrc), 
		.result(input2)
	);
	
	ALU alu (
		.ALUCnt(ALUCnt), 
		.input1(AluReadData1), 
		.input2(input2), 
		.Shamt(Immediate[10:6]), 
		.result(ALUResult), 
		.Zero(Zero)
	);
	
	ALUControl aluControl (
		.funct(funct), 
		.ALUOp(ALUOp), 
		.ALUCnt(ALUCnt)
	);

endmodule
