`timescale 1ns / 1ps
module Booth_AdderSubtractor
	(
	input [31:0] A,
	input [31:0] M,
	input [1:0] BoothOp,
	
	output [31:0] result
    );

	 assign result = BoothOp == 2'b01 ? A+M:
							BoothOp == 2'b10 ? A-M:
							A;
endmodule
