//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:Alex Wainwright
// Date: 15/6/20
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(a,b,sel,out);
    
	input a;
	input b;
	input sel;
	output out;

    assign #5 out=(sel) ? b : a;               
      
endmodule
