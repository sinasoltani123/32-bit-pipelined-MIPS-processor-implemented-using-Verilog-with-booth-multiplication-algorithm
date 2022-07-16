`timescale 1ns / 1ps

module ALU
	(
	input [3:0] ALUCnt,
	input [31:0] input1,
	input [31:0] input2,
	input [4:0] Shamt,
	output [63:0] result,
	output Zero
    );
	 reg clk=0;
	 
	 reg [63:0]mul;
	
	 assign result = (

	(ALUCnt == 4'b0000) ? input1 + input2:
	(ALUCnt == 4'b0001) ? input1 - input2:
	(ALUCnt == 4'b0010) ? ~input1:
	
	(ALUCnt == 4'b0011) ? input1 << Shamt:
	(ALUCnt == 4'b0100) ? input1 >> Shamt:
	(ALUCnt == 4'b0101) ? input1 & input2:
	
	(ALUCnt == 4'b0110) ? input1 | input2:
	(ALUCnt == 4'b0111) ? (input1 < input2 ? 1:0) : 
	(ALUCnt == 4'b1000) ? mul:				//new for multiplication
	32'bx
	
	);
	
	
	
	assign Zero = (  (result == 0) ? 1'b1 : 1'b0   );


	BoothMultipilcation uut (
        .clk(clk),
		  .X(input1), 
        .Y(input2), 
        .Z(mul)
    );

endmodule
