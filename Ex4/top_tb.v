//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:Alex W
// Date: 16/06/20
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);
	parameter CLK_PERIOD = 10;

	reg clk;
	reg rst;
	reg button;
	reg err;

	wire [2:0] throw;

initial
begin
	clk=1'b0;
	forever
		#(CLK_PERIOD/2) clk =~clk;
end

initial begin
		rst = 0;
		button = 1;
		err = 0;
	
		forever 
		begin
			#1
			rst=0;
			#10
			if (throw ==0) 
			begin
			$display("***Test fail*** no roll");
			err = 1;
			end
			#60
			rst = 1;
			if (throw != 3'b001)
			begin
			$display("***Test Fail! no reset");
			err = 1;
			end
		end
	end
initial begin 
	#160
	if (err ==0)
	$display("***Test Passed***");
	$finish;
	end

dice top (
.clk(clk), .rst (rst), .button(button), .throw (throw) 
);

endmodule


	





