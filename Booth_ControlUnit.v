`timescale 1ns / 1ps

module Booth_ControlUnit
	(
	input q0,
	input q1,
	
	output reg [1:0] BoothOp
    );
	 
	always@(*) begin
	$display("q1 = %b  , q0=%b",q1,q0);
		case({q1,q0})
		
			2'b01:begin
					BoothOp = 2'b01;
					$display("%b",BoothOp);
					end
			2'b10:begin
					BoothOp = 2'b10;
					$display("%b",BoothOp);
					end
			default: BoothOp = 2'b00;
		
		endcase
	end

endmodule
