//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:Alex W	
// Date: 17/6/20
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

module dicelight (rst, clk, button,sel, result);

input rst, clk, button,sel;
output [2:0] result;
wire [2:0] throw;
wire red,amber,green;

dice mydice(rst,clk,button,throw);
traffic mytraffic(red,amber,green,clk);

mux mysel(throw[2:0],{red,amber,green},sel,result[2:0]);

endmodule


