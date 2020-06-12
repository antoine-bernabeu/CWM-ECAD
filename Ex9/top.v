//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name: Bernabeu Antoine
// Date: 12/06/2020
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top(
    input clk_p,
    input clk_n,
     //Todo: add all other ports besides clk_n and clk_p
	input rst_n,
	input button,
	output [2:0]led
   );
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here
	parameter DIVISOR0 = 28'd100000000;
	parameter DIVISOR1 = 28'd50000000;
	parameter DIVISOR2 = 28'd10000000;

	reg[27:0] counter0=28'd0;
	reg[27:0] counter1=28'd0;
	reg[27:0] counter2=28'd0;
	
	wire clk_0;
	wire clk_1;
	wire clk_2;

	reg reg_led0;
	reg reg_led1;
	reg reg_led2;
	
	assign led[0]=reg_led0;
	assign led[1]=reg_led1;
	assign led[2]=reg_led2;

	always @(clk)
	begin
		counter0 = counter0 + 28'd1;
		counter1 = counter1 + 28'd1;
 		counter2 = counter2 + 28'd1;
 		if(counter0>=(DIVISOR0-1))
  			counter0 = 28'd0;
 		if(counter1>=(DIVISOR1-1))
  			counter1 = 28'd0;
 		if(counter2>=(DIVISOR2-1))
  			counter2 = 28'd0;
	end
	assign clk_0 = (counter0<DIVISOR0/2)?1'b0:1'b1;
	assign clk_1 = (counter1<DIVISOR1/2)?1'b0:1'b1;
	assign clk_2 = (counter2<DIVISOR2/2)?1'b0:1'b1;

	always @(clk_0)
	begin
		if(!rst_n)
			reg_led0=1'b0;
		else
			if(button)
				reg_led0=1'b0;
			else
				reg_led0=~reg_led0;
	end
	always @(clk_1)
	begin
		if(!rst_n)
			reg_led1=1'b0;
		else
			if(button)
				reg_led1=1'b0;
			else
				reg_led1=~reg_led1;
	end
	always @(clk_2)
	begin
		if(!rst_n)
			reg_led2=1'b0;
		else
			if(button)
				reg_led2=1'b0;
			else
				reg_led2=~reg_led2;
	end
endmodule
