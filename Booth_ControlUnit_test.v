`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:54:26 07/08/2022
// Design Name:   Booth_ControlUnit
// Module Name:   F:/xilinx_project/Hw4/Booth_ControlUnit_test.v
// Project Name:  Hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Booth_ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Booth_ControlUnit_test;

	// Inputs
	reg q0;
	reg q1;

	// Outputs
	wire [1:0] q1q0;

	// Instantiate the Unit Under Test (UUT)
	Booth_ControlUnit uut (
		.q0(q0), 
		.q1(q1), 
		.BoothOp(q1q0)
	);

	initial begin
		// Initialize Inputs
		q0 = 0;
		q1 = 0;
		#100;
        
		q0 = 1;
		q1 = 0;
		#100;
        
		q0 = 0;
		q1 = 1;
		#100;
        
		q0 = 1;
		q1 = 1;
        

		// Add stimulus here

	end
      
endmodule

