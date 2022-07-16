`timescale 1ns / 1ps

module mux
	 #(
    //parameters
	 parameter NO_of_mux_inputs = 32	//defult 32 bit multiplexer
	 )
	 (
	 //ports declaration 
	 input [NO_of_mux_inputs-1:0] inp1,
	 input [NO_of_mux_inputs-1:0] inp2,
	 input select,
	 output reg[NO_of_mux_inputs-1:0] result
	 );
	 
	 
	
	 always@(inp1,inp2,select) begin
		if(select == 0)
			result = inp1;
		else
			result = inp2;
	 end


endmodule
