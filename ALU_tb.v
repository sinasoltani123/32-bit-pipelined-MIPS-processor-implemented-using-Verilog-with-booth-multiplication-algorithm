`timescale 1ns / 1ps

module ALU_tb;

	// Inputs
	reg [3:0] ALUCnt;
	reg [31:0] input1;
	reg [31:0] input2;
	reg [4:0] Shamt;

	// Outputs
	wire [31:0] result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.ALUCnt(ALUCnt), 
		.input1(input1), 
		.input2(input2), 
		.Shamt(Shamt), 
		.result(result), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		ALUCnt = 0;
		input1 = 4;
		input2 = 5;
		Shamt = 2;

		// Wait 100 ns for global reset to finish
		#100;
		ALUCnt = 0;
		
		#100;
		ALUCnt = 1;
      
#100;
		ALUCnt = 2;

		#100;
		ALUCnt = 3;
		
		#100;
		Shamt = 4;
		
		#100;
		ALUCnt = 4;
		
		#100;
		ALUCnt = 5;
		
		#100;
		ALUCnt = 6;
		
		#100;
		ALUCnt =7;
				
		

		// Add stimulus here

	end
      
endmodule

