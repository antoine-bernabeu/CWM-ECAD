//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Bernabeu Antoine
// Date: 11/06/2020
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
`timescale 1ns / 100ps

module multiplier(
            input clk,
            input rst,
            input [2:0]a,
            input [2:0]b,
            input enable,
            output [5:0]result
            );
wire arready_output;
wire [1:0] rresp_output;
wire rvalid_output;
wire [31:0]rdata_output;
wire [31:0] addr;
assign addr={25'b0,a,b}<<2;
assign result=rdata_output[5:0];

blk_mem_gen_0 blk_mem_gen_0(.s_aclk(clk),.s_aresetn (rst),.s_axi_araddr({25'b0,a,b}<<2),.s_axi_arvalid(1'b1),.s_axi_arready(arready_output),.s_axi_rresp (rresp_output),.s_axi_rvalid (rvalid_output),.s_axi_rready (1'b1),.s_axi_rdata(rdata_output));

endmodule
