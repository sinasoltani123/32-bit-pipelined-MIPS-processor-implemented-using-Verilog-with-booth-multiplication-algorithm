`timescale 1ns / 1ps

module Decode
	(
	input clk,
	input [31:0] Instruction,
	input RegWrite,
	input [4:0] WriteReg,
	input [31:0] WriteData,
	
	
	output [5:0] Opcode,
	output [31:0] Read_Data_1,
	output [31:0] Read_Data_2,
	
	output [31:0] Sign_Extended_Immediate,
	
	output [4:0] rt,
	output [4:0] rd
    );

	assign Opcode = Instruction[31:26];
	
	wire [15:0]Immediate;
	wire [4:0]rs;
	
	assign rs = Instruction[25:21];
	assign rt = Instruction[20:16];
	assign rd = Instruction[15:11];
	assign Immediate = Instruction[15:0];
	
	SignExtend Sign_Extend (
		.Value(Immediate), 
		.Sign_Extended_Value(Sign_Extended_Immediate)
	);
	
	RegisterFile RegFile (
		.clk(clk), 	//ok
		.RegWrite(RegWrite), //ok
		.Write_Reg(WriteReg),//ok
		.Write_Data(WriteData), //ok
		.Read_Reg_1(rs), 
		.Read_Reg_2(rt), 
		
		.Read_Data_1(Read_Data_1), 
		.Read_Data_2(Read_Data_2)
	);
	
	
endmodule
