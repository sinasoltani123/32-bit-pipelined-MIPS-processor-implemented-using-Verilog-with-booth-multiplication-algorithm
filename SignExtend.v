`timescale 1ns / 1ps

module SignExtend
	(
	input [15:0] Value,
	output [31:0] Sign_Extended_Value
    );
	 
	 //concatination 
	 assign Sign_Extended_Value = {{16{Value[15]}} , Value[15:0]}; 

endmodule
