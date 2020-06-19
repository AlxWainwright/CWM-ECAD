//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns /100ps

module top_tb(
);

parameter CLK_PERIOD = 10;
reg clk;
reg [2:0] a;
reg [2:0] b;
wire [5:0] result;
reg read;

initial
begin
	clk = 1'b0;
	forever
	 #(CLK_PERIOD/2) clk=~2;
end

initial begin
	a=0;
	b=0;
	read=0;
	#100;
	read=1;
	forever begin
		#(2*CLK_PERIOD)
		$display("a=%d, b=%d, a*b=%d", a,b,result);
		$finish;
		end;

timestable top(
	.clk(clk),
	.a(a),
	.b(b),
	.result(result[5:0]),
	.read(read)
	);

endmodule;
