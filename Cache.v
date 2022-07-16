`timescale 1ns / 1ps

module Cache
	 (
	 input [31:0] Address,
	 input [127:0] DataLine,
	 input clk,
	 output reg[31:0] Instruction,
	 output reg Hit
	 );
	 
	 //wires and variables declaration
	 reg [153:0] Cache [7:0];
	 //reg [3:0] counter=0; //baraye 5 clk
	 integer i;
	 
	 //address jadid
	 reg [1:0] offset;
	 reg [2:0] index;
	 reg [24:0] tag;
	 
	 always@(Address) begin
		offset = Address[3:2];
		index = Address[6:4];
		tag = Address[31:7];

	 end
	 
	 //address vojood dare
	 always@(posedge clk) begin
	 //$display("in posedge");
		//for(i=0;i<8;i=i+1)begin
			//$display("Cache[i] = %b", Cache[i]);
		//end
		//$display("bala Hit = ",Hit);
		if(Cache[index][153] == 1 && tag == Cache[index][152:128] && Address[1:0] == 2'b00) begin  //valid bit and tag
			//$display("Cache[index][153] ==  %d",Cache[index][153]);
			
			Hit = 1;
			
			if(offset == 0)begin
				Instruction = Cache[index][31:0];
			end
			
			else if (offset == 1)begin
				Instruction = Cache[index][63:32];
			end
			
			else if (offset == 2)begin
				Instruction = Cache[index][95:64];
			end
			
			else if (offset == 3)begin
				Instruction = Cache[index][127:96];
			end
			
			else begin
				Hit = 0;
				Instruction = 32'bx;
			end
		end
		
		else begin
			Hit = 0;
			Instruction = 32'bx;
		end
		//$display("paiin Hit = ",Hit);
		
	 end
	 
	 //address vojood nadare
	 always@(DataLine) begin
		//for(i=0;i<8;i=i+1)begin
			//$display("in Dataline Cache[i] = %b", Cache[i]);
		//end
		//$display("counter = %d",counter);
		//$display("in dataline");
		//if (counter < 5) begin
			//counter = counter +1;
		//end
		
		//else if (counter == 5 && DataLine !== 128'bx ) begin
		if(DataLine !== 128'bx ) begin
			Cache[index][152:128] <= tag; //25bit
			Cache[index][153] <= 1; //valid mikonim 1bit
//			counter <= 0;
			Cache[index][127:0] <= DataLine; // 128bit
			//25+1+128 =154bits
		end
	 end
	 
	 
	//initialize valid bit Cache
	initial begin
		for (i = 0; i<8 ;i=i+1) begin
		 	Cache[i] = 0;
		end
		//for(i=0;i<8;i=i+1)begin
			//$display("Cache[i] = %b", Cache[i]);
		//end
	end

endmodule
