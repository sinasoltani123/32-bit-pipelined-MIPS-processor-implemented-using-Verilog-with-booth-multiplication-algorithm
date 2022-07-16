`timescale 1ns / 1ps

module Multiplexer
	 #(
    //parameters
	 parameter NO_of_mux_inputs = 32	//defult 32 bit multiplexer
	 )
	 (
	 //ports declaration 
	 input [NO_of_mux_inputs-1:0] PC,
	 input [NO_of_mux_inputs-1:0] BranchTarget,
	 input PCSource,
	 output reg[NO_of_mux_inputs-1:0] Address
	 );
	 
	 
	
	 always@(PC,BranchTarget,PCSource) begin
		if(PCSource == 0)begin
			Address = PC;
		end
		else begin
			Address = BranchTarget;
		end
		//$display("BranchTarget in mux = %b",BranchTarget);
		//$display("address in mux = %b",Address);

	 end


endmodule
