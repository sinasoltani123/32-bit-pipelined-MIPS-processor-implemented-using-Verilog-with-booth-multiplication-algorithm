`timescale 1ns / 1ps

module MIPS_tb;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	MIPS uut (
		.clk(clk)
	);

	initial begin 
		clk = 0;
	end
	always #50 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

