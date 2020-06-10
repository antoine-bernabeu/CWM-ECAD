//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Bernabeu Antoine
// Date: 10/06/2020
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

`timescale 1ns / 100ps

module dice_light(
            input rst,
            input clk,
            input button,
            input sel,
            output [2:0] result
            );
wire [2:0]throw;
wire [2:0] res;
wire red;
wire amber;
wire green;

wire [2:0] light;

dice_module dice(.clk(clk),.rst(rst),.button(button),.throw(throw));
tlc_module tlc(.clk(clk),.red(red),.amber(amber),.green(green));

assign light[0]=green;
assign light[1]=amber;
assign light[2]=red;

mux_module mux(.a(throw),.b(light),.sel(sel),.out(res));
assign result=res;
endmodule
