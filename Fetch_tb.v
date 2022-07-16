`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:17:15 06/10/2022
// Design Name:   Fetch
// Module Name:   F:/xilinx_project/Hw4/Fetch_tb.v
// Project Name:  Hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fetch_tb;

	// Inputs
	reg [31:0] BranchTarget;
	reg PCSource;
	reg clk;

	// Outputs
	wire [31:0] NextPC;
	wire [31:0] Instruction;
	wire Hit;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.BranchTarget(BranchTarget), 
		.PCSource(PCSource), 
		.clk(clk), 
		.NextPC(NextPC), 
		.Instruction(Instruction), 
		.Hit(Hit)
	);

	initial begin
		// Initialize Inputs
		BranchTarget = 0;
		PCSource = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

