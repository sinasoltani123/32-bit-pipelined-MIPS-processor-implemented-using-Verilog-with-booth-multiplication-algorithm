`timescale 1ns / 1ps

module DataMemory_tb;

	// Inputs
	reg clk;
	reg MemRead;
	reg MemWrite;
	reg [31:0] address;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.address(address), 
		.writeData(writeData), 
		.readData(readData)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		MemRead = 0;
		MemWrite = 0;
		address = 0;
		writeData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

