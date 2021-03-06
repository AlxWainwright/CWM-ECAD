//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dice(

input  rst, 
input clk,
input button,
output [2:0] throw
);

reg [2:0] throw;
initial 
begin
throw = 0;
end
	always @(posedge clk or posedge rst) 
begin

		if (rst)	 
			throw <= 1;
		else
			if (button)
				if (throw < 6)
					throw <= throw +1;
				else
					throw <=1;
			else
				throw <= throw;	
			
end
endmodule
