`timescale 1ns / 1ps

module InstructionMemory
	 (
	 //ports declaration
	 input [31:0] Address,
	 input clk,
	 output reg[127:0] DataLine
	 ); 
	  
	 
	 //wires and variables declaration
	 reg [7:0] memory [1023:0];
	 integer counter=0;
	 integer i;
	 reg [27:0] locality;
	 
	 //initial block. Initialize memory.
	 initial begin
		for(i = 0; i < 1024; i = i+1) begin
			memory[i] = i;
		end
	 end
	  
	 //always@(clk edge) blocks
	 always@(posedge clk) begin
	
	//case inequality !== !=
	//$display("locality1 = %b",locality);
	//$display("Address = %b",Address);
		if(locality !== Address[31:4]) begin
		//$display("too if");
			counter <= 0;
			locality <= Address[31:4];
			DataLine <= 128'bx;
			//$display("locality2 = %b",locality);
		end
		
		else  begin
			if(counter < 5) begin
				counter <= counter +1;
			end
			
			else if(counter == 5) begin
				
				//000010={3'b000,4'b010} concatination operation		

				//for loop i
				//dataline[127:120] = memory[{locality,4'd3}];
				//dataline[119:112] = memory[{locality,4'd2}];
				//...
				//$display("DataLine = %b",DataLine);
					DataLine <= {
					
						memory[{locality,4'd15}],
						memory[{locality,4'd14}],
						memory[{locality,4'd13}],
						memory[{locality,4'd12}],
						
						memory[{locality,4'd11}],
						memory[{locality,4'd10}],
						memory[{locality,4'd9}],
						memory[{locality,4'd8}],
						
						memory[{locality,4'd7}],
						memory[{locality,4'd6}],
						memory[{locality,4'd5}],
						memory[{locality,4'd4}],
												
						memory[{locality,4'd3}],
						memory[{locality,4'd2}],
						memory[{locality,4'd1}],
						memory[{locality,4'd0}]
						
					};
				//$display("DataLine = %b",DataLine);
				counter <= 0;
			end
		end
	 end
	 

	initial begin 
	//0x014B4800 add t1 t2 t3
		memory[7]=8'h01;
		memory[6]=8'h4B;
		memory[5]=8'h48;
		memory[4]=8'h00;
		
		memory[3]=8'h01;
		memory[2]=8'h4B;
		memory[1]=8'h48;
		memory[0]=8'h00;
		
		
			//1D49FFFF	addi t1 t2 0x00ff
		//memory[3]=8'h1d;
		//memory[2]=8'h49;
		//memory[1]=8'h00;
		//memory[0]=8'hff;
		//lw r5 r0 0
		//memory[3:0] = {32'h10050000};
		
		
		// add t1 t2 t3
		//memory[7:4] ={32'h014B4800};
		
	end

endmodule
