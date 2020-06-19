//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////


module timestable( clk,rst,a,b,read,result);

input clk;
input rst;
input read;
input [2:0] a;
input [2:0] b;
output ref [5:0] result;

wire [31:0] s_axi_raddr={24'h0 ,b ,a ,2'b0};
wire rsta_busy;
wire rstb_busy;
wire s_axi_arready,s_axi_rvalid;
wire s_axi_read;
wire [31:0] s_axi_rdata;

assign s_axi_read = read&(rsta_busy==0)&(rstb_busy==0)&s_axi_arready;

always @(posedge clk)
begin
	if (rst) 
	  result<=#1 0;
	else begin
	  result<=#1 s_axi_rvalid ? s_axi_rdata[5:0] : result;
	end
end

blk_mem_gen_0 timestable_mem (

	.rsta_busy(rsta_busy),
	.rstb_busy(rstb_busy),
	.s_aclk(clk),
	.s_aresern(1'b1),
	.s_axi_awaddr(32'h0),
	.s_axi_awvalid(32'h0),
	.s_axi_awready(),
	.s_axi_wdata(32'h0),
	.s_axi_wstrb(4'h0),
	.s_axi_wvalid(1'b0),
	.s_axi_wready(),
	.s_axi_bresp(),
	.s_axi_bvalid(),
	.s_axi_bready(1'b1),
	.s_axi_araddr(s_axi_raddr),
	.s_axi_arvalid(s_axi_read),
	.s_axi_arready(s_axi_arready),
	.s_axi_rdata(s_axi_rdata),
	.s_axi_rresp(),
	.s_axi_rvalid(s_axi_rvalid),
	.s_axi_rready(1'b1)
				);







