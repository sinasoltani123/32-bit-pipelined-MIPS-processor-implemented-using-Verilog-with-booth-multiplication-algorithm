`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:17:32 06/10/2022
// Design Name:   IFID
// Module Name:   F:/xilinx_project/Hw4/IFID_tb.v
// Project Name:  Hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IFID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IFID_tb;

	// Inputs
	reg clk;
	reg [31:0] nextPC;
	reg [31:0] Instruction;
	reg hit;

	// Outputs
	wire [31:0] instruction_out;
	wire [31:0] nextPC_out;
	wire hit_out;

	// Instantiate the Unit Under Test (UUT)
	IFID uut (
		.clk(clk), 
		.nextPC(nextPC), 
		.Instruction(Instruction), 
		.hit(hit), 
		.instruction_out(instruction_out), 
		.nextPC_out(nextPC_out), 
		.hit_out(hit_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		nextPC = 0;
		Instruction = 0;
		hit = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

