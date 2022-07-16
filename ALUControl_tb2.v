`timescale 1ns / 1ps

module ALUControl_tb2;

	// Inputs
	reg [5:0] funct;
	reg [2:0] ALUOp;

	// Outputs
	wire [3:0] ALUCnt;

	// Instantiate the Unit Under Test (UUT)
	ALUControl uut (
		.funct(funct), 
		.ALUOp(ALUOp), 
		.ALUCnt(ALUCnt)
	);

	initial begin
		// Initialize Inputs
		funct = 0;
		ALUOp = 0;

		// Wait 100 ns for global reset to finish
		#100;
		funct = 1;
		
		#100;
		funct = 2;
		
		#100;
		funct = 3;
		
		#100;
		funct = 4;
		
		#100;
		funct = 5;
		
		#100;
		funct = 6;
		
		#100;
		funct = 7;
		
		#100;
		funct = 8;
		
		#100;
		ALUOp = 1;
		#100;
		ALUOp = 2;
		#100;
		ALUOp = 3;
		
		#100;
		ALUOp = 4;
        
		// Add stimulus here

	end
      
endmodule

