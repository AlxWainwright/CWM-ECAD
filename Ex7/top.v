//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module timestable(clk,a,b,read,result);

input clk;
input [2:0] a;
input [2:0] b;
input read;

output [5:0] result;

blk_mem your_instance_name (
  .clka(clk),    // input wire clka
  .ena(read),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra({a,b}),  // input wire [5 : 0] addra
  .dina(6'h0),    // input wire [5 : 0] dina
  .douta(result)  // output wire [5 : 0] douta
);


endmodule
