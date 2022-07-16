`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:50:36 06/14/2022
// Design Name:   mux
// Module Name:   F:/xilinx_project/Hw4/mux_tb4.v
// Project Name:  Hw4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_tb4;

	// Inputs
	reg [31:0] inp1;
	reg [31:0] inp2;
	reg select;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	mux #( 5 ) uut (
		.inp1(inp1), 
		.inp2(inp2), 
		.select(select), 
		.result(result)
	);
	initial begin
		// Initialize Inputs
		inp1 = 2;
		inp2 = 3;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
		select =1;
        
		// Add stimulus here

	end
      
endmodule

