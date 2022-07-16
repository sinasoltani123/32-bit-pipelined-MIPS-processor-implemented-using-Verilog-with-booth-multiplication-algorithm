`timescale 1ns / 1ps

module mux_tb;

	// Inputs
	reg [31:0] inp1;
	reg [31:0] inp2;
	reg select;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	mux uut (
		.inp1(inp1), 
		.inp2(inp2), 
		.select(select), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		inp1 = 1;
		inp2 = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

