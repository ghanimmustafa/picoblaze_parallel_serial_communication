`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:36:31 01/02/2019
// Design Name:   TopModule
// Module Name:   /home/ise/Embedded/Final_Proje/project1/test.v
// Project Name:  project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset)
	);

	    always 
        #10 clk = !clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;


		// Wait 100 ns for global reset to finish
		#50;
		// Add stimulus here
		reset = 0;
		#50;
		
	end
      
endmodule

