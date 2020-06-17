//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:Alex W
// Date: 17/6/20
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	//Parameters
	parameter CLK_PERIOD = 10;

	reg clk;
	wire red;
	wire amber;
	wire green;

	//clock
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin
	#200
	$finish;
	end

traffic top (
	.clk(clk),
	.red(red),
	.amber(amber),
	.green(green)
	);
endmodule
