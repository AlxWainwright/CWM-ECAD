//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module traffic(red, amber, green,clk);

input clk;
output reg red, amber, green;

always @(posedge clk)

case ({red,amber,green})
	3'b100 : begin red=red; amber=!amber; green=green;end
	3'b110 : begin red=!red; amber=!amber;green=!green;end
	3'b001 : begin red=red; amber=!amber; green=!green;end
	3'b010 : begin red=!red; amber=!amber; green=green;end
	default: begin red=1; amber=0; green=0;end
endcase

endmodule
