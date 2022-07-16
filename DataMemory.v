`timescale 1ns / 1ps

module DataMemory
	(
	input clk,
	input MemRead,
	input MemWrite,
	input [31:0] address,
	input [31:0] writeData,
	
	output reg [31:0]readData
    );
	
	reg [7:0] datamemory [1023:0];
	
	integer i;
	initial begin
		for(i=0;i<1024 ;i=i+1)begin
			datamemory[i]=i;
		end
	end	
	
	always @ (posedge clk) begin
		if (MemRead === 1) begin
			readData <= {
							datamemory[address+3],
							datamemory[address+2],
							datamemory[address+1],
							datamemory[address]
							};
		end
		
		if (MemWrite === 1) begin 
			datamemory[address] <= writeData[7:0];
			datamemory[address+1] <= writeData[15:8];
			datamemory[address+2] <= writeData[23:16];
			datamemory[address+3] <= writeData[31:24];
		end
		
		if(MemRead === 1 && MemWrite === 1) begin
			$display("Error : MemRead and MemWrite are 1 simultaneously!");
		end
	end

endmodule
