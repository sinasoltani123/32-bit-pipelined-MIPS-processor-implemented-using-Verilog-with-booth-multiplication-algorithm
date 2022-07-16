`timescale 1ns / 1ps

module MEM_WB
	(
	input clk,
	input hit,
	input [31:0] readData,
	input [31:0] ALUResult,
	input [4:0] writeReg,
	input RegWrite,
	input MemToReg,
	
	
	output reg hitOut,
	output reg [31:0]readDataOut,
	output reg [31:0] ALUResultOut,
	output reg [4:0]writeRegOut,
	output reg RegWriteOut,
	output reg MemToRegOut

    );

	always@(negedge clk)begin
		if(hit === 1)begin
			hitOut <= hit;
			writeRegOut <= writeReg;
			RegWriteOut <= RegWrite;
			readDataOut <= readData;
			ALUResultOut <= ALUResult;
			MemToRegOut <= MemToReg;			
		end
	end

endmodule
