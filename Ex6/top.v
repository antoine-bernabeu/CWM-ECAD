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
wire throw;
wire red;
wire amber;
wire green;

wire [2:0] light;
wire [2:0] res;

dice dice(clk,rst,button,throw);
tlc tlc(clk,red,amber,green);

assign light[0]=green;
assign light[1]=amber;
assign light[2]=red;

mux mux(throw,light,sel,res);

assign result=res;
endmodule
