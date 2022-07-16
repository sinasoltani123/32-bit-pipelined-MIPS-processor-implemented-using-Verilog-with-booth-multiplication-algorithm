`timescale 1ns / 1ps

module RegisterFile
	(
	input clk,
	input RegWrite,
	input [4:0] Write_Reg, 
	input [31:0] Write_Data,
	
	input [4:0] Read_Reg_1,
	input [4:0] Read_Reg_2,
	
	output  [31:0] Read_Data_1,
	output  [31:0] Read_Data_2
	
    );
	 
	 reg [31:0] register_file [31:0];
	 integer index;
	 
	 initial begin
		for(index =0;index<32 ; index = index+1) begin
			register_file[index] = index;
		end
	 end
	 
	 
	 assign Read_Data_1 = register_file[Read_Reg_1];
	 assign Read_Data_2 = register_file[Read_Reg_2];
		
	 always @(posedge clk) begin
		if(RegWrite == 1 && Write_Reg != 0) begin
			register_file[Write_Reg] <= Write_Data;
			
		end
	 
	 end

	//always @(Read_Reg_1 , Read_Reg_2) begin 
		//Read_Data_1 = register_file[Read_Reg_1];
		//Read_Data_2 = register_file[Read_Reg_2];
	//end

endmodule
