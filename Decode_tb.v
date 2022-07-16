`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:53 06/10/2022
// Design Name:   Decode
// Module Name:   F:/xilinx_project/Hw4/Decode_tb.v
// Project Name:  Hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Decode_tb;

	// Inputs
	reg clk;
	reg [31:0] Instruction;
	reg RegWrite;

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
		.Opcode(Opcode), 
		.Read_Data_1(Read_Data_1), 
		.Read_Data_2(Read_Data_2), 
		.Sign_Extended_Immediate(Sign_Extended_Immediate), 
		.rt(rt), 
		.rd(rd)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Instruction = 0;
		RegWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

