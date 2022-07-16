`timescale 1ns / 1ps


module fetch_new_test_bench;

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
		clk = 0;
	end
	always #50 clk = ~clk;
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

