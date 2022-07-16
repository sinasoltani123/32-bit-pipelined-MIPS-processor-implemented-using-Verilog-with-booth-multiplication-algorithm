`timescale 1ns / 1ps

module BoothMultiplication_tb;

	// Inputs
	reg clk;
	reg [31:0] Multiplicand;
	reg [31:0] Multiplier;
	reg run;

	// Outputs
	wire isValid;
	wire [63:0] result;

	// Instantiate the Unit Under Test (UUT)
	BoothMultipilcation uut (
		.clk(clk), 
		.Multiplicand(Multiplicand), 
		.Multiplier(Multiplier), 
		.run(run), 
		.isValid(isValid), 
		.result(result)
	);
	
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		
		clk = 0;
		Multiplicand = 4;
		Multiplier = -7;
		run = 0;
		// Wait 100 ns for global reset to finish
		#170;
		run = 1;
		#400;
		run = 0;
		#40;
		run = 1;
	end
      
endmodule

