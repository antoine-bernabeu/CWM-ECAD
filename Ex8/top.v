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
wire [25:0] some_zero;
wire arready_output;
wire [1:0] rresp_output;
wire rvalid_output;
wire [31:0]rdata_output;
wire [31:0] addr;
assign addr={some_zero,a,b};
assign some_zero=26'b0;
assign result[0]=rdata_output[0];
assign result[1]=rdata_output[1];
assign result[2]=rdata_output[2];
assign result[3]=rdata_output[3];
assign result[4]=rdata_output[4];
assign result[5]=rdata_output[5];

blk_mem_gen_0 blk_mem_gen_0(.s_aclk(clk),.s_aresetn (rst),.s_axi_araddr({some_zero,a,b}),.s_axi_arvalid(1'b1),.s_axi_arready(arready_output),.s_axi_rresp (rresp_output),.s_axi_rvalid (rvalid_output),.s_axi_rready (1'b1),.s_axi_rdata(rdata_output));

endmodule
