//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	//Parameters
	parameter CLK_PERIOD = 10;
	
	reg clk;
	reg sel;
	reg button;
	wire red, amber,green;
	wire [2:0] result;


//clock
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

initial begin
	sel=0;
	button=1;
	#200
	sel=1;
	#200
	$finish;
	end

dicelight top (
	.rst(rst),
	.clk(clk),
	.button(button),
	.sel(sel),
	.result(result[2:0])
	);
endmodule
