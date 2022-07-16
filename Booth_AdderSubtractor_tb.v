`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:34:40 07/08/2022
// Design Name:   Booth_AdderSubtractor
// Module Name:   F:/xilinx_project/Hw4/Booth_AdderSubtractor_tb.v
// Project Name:  Hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Booth_AdderSubtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Booth_AdderSubtractor_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] M;
	reg [1:0] q1q0;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	Booth_AdderSubtractor uut (
		.A(A), 
		.M(M), 
		.BoothOp(q1q0),
		
		.result(result)
	);

	initial begin
		// Initialize Inputs
		A = 5;
		M = 2;
		q1q0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		q1q0 = 1;
		#100;
		q1q0 = 2;
		#100;
		q1q0 = 3;
        
		// Add stimulus here

	end
      
endmodule

