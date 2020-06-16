//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:Alex Wainwright	
// Date: 16/6/20
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10;
//Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg direction;
    reg enable;
    reg err;
    wire counter_out[7:0];
//Todo: Clock generation
 initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
//Todo: User logic
initial begin 
//enable test
	rst =0;
	enable = 0;
	err = 0;
	direction=1;
	#20
	if (counter_out = 2)
		begin
			$display("***Test Failed enable***");
			err =1;
		end
//rst test
	rst = 1;
	enable =1;
	direction =1;
 	#10
	if (counter_out = 3)
		begin
			$display("***Test Failed rst***");
			err =1;
		end	
//count up 
	rst = 0;
	enable =1;
	direction =1;
	#10;
	if (counter_out = 0)
		begin
			$display("***Test Failed up***");
			err =1;
		end
//count down
	rst = 0;
	enable =1;
	direction =0;
	#10;
	if (counter_out = 0)
		begin
			$display("***Test Failed down***");
			err =1;
		end		    
   end
//Todo: Finish test, check for success
	if (err ==0) 
		$display("***Test Passed***");
//Todo: Instantiate counter module
	counter counter_one(clk,reset, enable,direction, counter_out);
 
endmodule 







