`timescale 1ns / 1ps

module PCRegister
	 (
	 //ports declaration 
	 input [31:0] pcRegInput,
	 input clk,
	 input Hit,
	 output reg [31:0] Address
	 );
	 
	 
	 always@(negedge clk) begin
		if(Hit == 1)begin
			Address = pcRegInput;
		end
		//$display("pcreginput = %b",pcRegInput);
		//$display("Hit = %b",Hit);
		//$display("Address = %b",Address);
	 end
	 
	 initial begin
		Address=0;
	 end

	
endmodule
