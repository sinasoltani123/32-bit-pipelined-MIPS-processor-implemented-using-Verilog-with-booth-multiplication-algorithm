`timescale 1ns / 1ps


module Decode_new_tb;

	// Inputs
	reg clk;
	reg [31:0] Instruction;
	reg RegWrite;
	reg [4:0] WriteReg;
	reg [31:0] WriteData;

	// Outputs
	wire [5:0] Opcode;
	wire [31:0] Read_Data_1;
	wire [31:0] Read_Data_2;
	wire [31:0] Sign_Extended_Immediate;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	Decode uut (
		.clk(clk), 
		.Instruction(Instruction), 
		.RegWrite(RegWrite), 
		.WriteReg(WriteReg), 
		.WriteData(WriteData), 
		
		.Opcode(Opcode), 
		.Read_Data_1(Read_Data_1), 
		.Read_Data_2(Read_Data_2), 
		.Sign_Extended_Immediate(Sign_Extended_Immediate), 
		.rt(rt), 
		.rd(rd)
	);
//clock generation
	initial begin 
		clk = 0;
	end
	always #50 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		Instruction = 500_000;
		RegWrite = 0;
		WriteReg = 0;
		WriteData = 0;

		// Wait 100 ns for global reset to finish
		#100;
		RegWrite = 1;
		WriteReg = 7;
		WriteData = 15;

		
        
		// Add stimulus here

	end
      
endmodule

