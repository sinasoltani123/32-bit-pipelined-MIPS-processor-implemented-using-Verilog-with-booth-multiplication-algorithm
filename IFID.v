`timescale 1ns / 1ps

module IFID
	(
	input clk,
	input [31:0]NextPC,
	input [31:0]Instruction,
	input Hit,
	
	output reg [31:0]instruction_out,
	output reg [31:0]nextPC_out,
	output reg hit_out
    );
	 
	 always @(negedge clk)begin
		instruction_out <= Instruction;
		hit_out <= Hit;
		nextPC_out <= NextPC;
	end


endmodule
