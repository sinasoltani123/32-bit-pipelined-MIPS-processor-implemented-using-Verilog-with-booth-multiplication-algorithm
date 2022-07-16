`timescale 1ns / 1ps

module Fetch
	(
	input [31:0] BranchTarget,
	input PCSource,
	input clk,
	
	output wire [31:0] NextPC,
	output wire [31:0] Instruction,
	output wire Hit
    );

	wire [127:0] DataLine;
	wire [31:0] Muxoutput;
	wire [31:0] Address;
	
	assign NextPC = Address +4;
	
	PCRegister pcRegister (
		.pcRegInput(Muxoutput), 
		.clk(clk), 
		.Hit(Hit), 
		.Address(Address)
	);
	
	Multiplexer mux (
		.PC(NextPC), 
		.BranchTarget(BranchTarget), 
		.PCSource(PCSource), 
		.Address(Muxoutput)
	);

	Cache cache (
		.Address(Address), 
		.DataLine(DataLine), 
		.clk(clk), 
		.Instruction(Instruction), 
		.Hit(Hit)
	);

	InstructionMemory instructionMemory (
		.Address(Address), 
		.clk(clk), 
		.DataLine(DataLine)
	);
	
	//always@(Address) begin
	//		NextPC= Address +4;
	//end
	
	
endmodule
