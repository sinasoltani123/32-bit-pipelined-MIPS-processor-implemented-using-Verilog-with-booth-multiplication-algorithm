`timescale 1ns / 1ps

module MEM_WB_tb;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] readData;
	reg [31:0] ALUResult;
	reg [4:0] writeReg;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire hitOut;
	wire [31:0] readDataOut;
	wire [31:0] ALUResultOut;
	wire [4:0] writeRegOut;
	wire RegWriteOut;
	wire MemToRegOut;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB uut (
		.clk(clk), 
		.hit(hit), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeReg(writeReg), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.hitOut(hitOut), 
		.readDataOut(readDataOut), 
		.ALUResultOut(ALUResultOut), 
		.writeRegOut(writeRegOut), 
		.RegWriteOut(RegWriteOut), 
		.MemToRegOut(MemToRegOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		hit = 0;
		readData = 0;
		ALUResult = 0;
		writeReg = 0;
		RegWrite = 0;
		MemToReg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

