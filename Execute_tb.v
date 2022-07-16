`timescale 1ns / 1ps


module Execute_tb;

	// Inputs
	reg clk;
	reg [31:0] AluReadData1;
	reg [31:0] AluReadData2;
	reg [31:0] Immediate;
	reg [5:0] funct;
	reg [2:0] ALUOp;
	reg ALUSrc;

	// Outputs
	wire [31:0] ALUResult;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clk(clk), 
		.AluReadData1(AluReadData1), 
		.AluReadData2(AluReadData2), 
		.Immediate(Immediate), 
		.funct(funct), 
		.ALUOp(ALUOp), 
		.ALUSrc(ALUSrc), 
		.ALUResult(ALUResult), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		AluReadData1 = 3;
		AluReadData2 = 4;
		Immediate = -1;
		funct = 0;
		ALUOp = 0;
		ALUSrc = 0;

		// Wait 100 ns for global reset to finish
		#100;
       funct =1;
		 
		 #100;
		 ALUSrc = 1;
		 #100;
		 ALUOp = 3;
		// Add stimulus here

	end
      
endmodule

