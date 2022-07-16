module BoothMultipilcation(clk, X, Y, Z);

		 input clk;
		 input signed [31:0] X, Y;
       output signed [63:0] Z;
       reg signed [63:0] Z;
		 
		 
       reg [1:0] temp;		// for 01 or 10
       integer i;
       reg E1;
		 
		 
       reg [31:0] Y1;
		 
		 
		 
       always @ (X, Y)
				 begin
						 Z = 64'd0;
						 E1 = 1'd0;
						 for (i = 0; i < 32; i = i + 1)
								begin
										 temp = {X[i], E1};
										 Y1 = - Y;
										case (temp)
											 2'd2 : Z [63 : 32] = Z [63 :32] + Y1;
											 2'd1 : Z [63 : 32] = Z [63 : 32] + Y;
											 default : begin end
										 endcase
										 Z = Z >>> 1;	//arithmatic shift
										 
										 
										
										 E1 = X[i];
								end
								
								if (Y == 32'h8000_0000)								
									begin
											Z = - Z;
									end
	
				end
      
       
endmodule