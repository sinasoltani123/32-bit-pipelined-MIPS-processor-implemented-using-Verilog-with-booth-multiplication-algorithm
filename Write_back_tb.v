`timescale 1ns / 1ps

module Write_back_tb;

	// Inputs
	reg MemtoReg;
	reg [31:0] readData;
	reg [31:0] ALUResult;

	// Outputs
	wire [31:0] writeData;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.MemtoReg(MemtoReg), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeData(writeData)
	);

	initial begin
		// Initialize Inputs
		MemtoReg = 0;
		readData = 2;
		ALUResult = 3;

		// Wait 100 ns for global reset to finish
		#100;
        MemtoReg = 1;
		// Add stimulus here

	end
      
endmodule

