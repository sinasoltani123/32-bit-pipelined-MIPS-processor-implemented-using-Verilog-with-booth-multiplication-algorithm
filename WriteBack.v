`timescale 1ns / 1ps

module WriteBack
	(
	input MemtoReg,
	input [31:0] readData,
	input [31:0] ALUResult,
	
	output wire [31:0]writeData
    );
	
	mux mux1 (
		.inp1(ALUResult), 
		.inp2(readData), 
		.select(MemtoReg), 
		.result(writeData)
	);
	
endmodule
