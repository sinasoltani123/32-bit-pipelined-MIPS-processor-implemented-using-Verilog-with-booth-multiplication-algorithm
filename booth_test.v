

`timescale 1ns / 1ps



module tb_Booth_Multiplier;

parameter N = 2;

//  UUT Signals

reg     Rst;
reg     Clk;

reg     Ld;
reg     [(2**N - 1):0] M;
reg     [(2**N - 1):0] R;

wire    Valid;
wire    [(2**(N+1) - 1):0] P;

//  Simulation Variables

reg     [2**(N+1):0] i;

// Instantiate the Unit Under Test (UUT)

BoothMultipilcation   #(
                        .pN(N)
                    ) uut (
                        .Rst(Rst), 
                        .Clk(Clk), 
                        .Ld(Ld), 
                        .M(M), 
                        .R(R), 
                        .Valid(Valid), 
                        .P(P)
                    );
initial begin
    // Initialize Inputs
    Rst = 1;
    Clk = 1;
    Ld  = 0;
    M   = 0;
    R   = 0;
    
    i   = 0;

    // Wait 100 ns for global reset to finish
    #101 Rst = 0;
    
    // Add stimulus here
    
    for(i = 0; i < (2**(2**(N+1))); i = i + 1) begin
        @(posedge Clk) #1 Ld = 1;
            M = i[(2**(N+1) - 1):2**N];
            R = i[(2**N - 1):0];
        @(posedge Clk) #1 Ld = 0;
        @(posedge Valid);
    end
    
end

///////////////////////////////////////////////////////////////////////////////

always #5 Clk = ~Clk;
      
///////////////////////////////////////////////////////////////////////////////

endmodule