//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Bernabeu Antoine
// Date: 10/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], enable
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module multiplier(
            input clk,
            input [2:0]a,
            input [2:0]b,
            input enable,
            output [5:0]result
            );
blk_mem_gen_0 blk_mem_gen_0(.clka(clk),.douta(result),.ena(enable),.wea(1'b0),.addra({a,b}));

endmodule
