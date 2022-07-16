module BoothTB;


    // Inputs
	 reg clk;
    reg [32:0] X;
    reg [32:0] Y;

    // Outputs
    wire [63:0] Z;

    // Instantiate the Unit Under Test (UUT)
    BoothMultipilcation uut (
        .clk(clk),
		  .X(X), 
        .Y(Y), 
        .Z(Z)
    );
//clock generation
	initial begin 
		clk = 0;
	end
	always #10 clk = ~clk;
    initial begin
        // Initialize Inputs
        X = 0;
        Y = 0;
		  clk=0;

        // Wait 100 ns for global reset to finish
        #100;
        X=-7;
          Y=-10;
        // Add stimulus here
		  
		  #100;
        X=8;
          Y=-7;
			 
			 #100;
        X=-2;
          Y=7;
			 
			 #100;
        X=30;
          Y=7;

    end
      
endmodule