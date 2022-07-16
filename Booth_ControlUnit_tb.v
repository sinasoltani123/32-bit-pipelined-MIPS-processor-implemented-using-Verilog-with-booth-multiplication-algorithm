`timescale 1ns / 1ps


module Booth_ControlUnit_tb;

	// Inputs
	reg q0;
	reg q1;
	wire [1:0] q1q0;

	// Instantiate the Unit Under Test (UUT)
	Booth_ControlUnit uut (
		.q0(q0),
		.q1(q1),
		.q1q0(q1q0)
	);

	initial begin
		// Initialize Inputs
		q0=0;
		q1=0;
		#100;

		q0=1;
		q1=0;
		#100;

		q0=0;
		q1=1;
		#100;

		q0=1;
		q1=1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

