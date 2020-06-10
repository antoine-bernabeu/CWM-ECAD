//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Bernabeu Antoine
// Date: 10/06/2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
);
    //Todo: Parameters
    parameter CLK_PERIOD = 10;
    
    //Todo: Regitsers and wires
    reg err;
    reg clk;
    reg rst;
    reg button;
    reg sel;
    reg [2:0] result_prev;
    wire [2:0]result;
    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end
    
    //Todo: User logic
     initial 
     begin
        rst=1;
        sel=0;
        button=0;
        err=0;
        #CLK_PERIOD
        if(result!=3'b000)
        begin
            $display("***TEST_FAILED! reset and sel dice, reset rst%d, select sel%d",rst,sel);
            err=1;
        end
        #(CLK_PERIOD*3)
        rst=0;
        forever
        begin
        button=1;
        #20
        result_prev=result;
        #CLK_PERIOD
        if(result!=result_prev+1)
        begin
            $display("***TEST_FAILED! dice, result%d, result_prev%d",result,result_prev);
            err=1;
        end    
        sel=1;
        #20
        result_prev=result;
        #CLK_PERIOD
        if((result_prev==3'b001 && result!=3'b010) || (result_prev==3'b010 && result!=3'b100) || (result_prev==3'b100 && result!=3'b110) || (result_prev==3'b110 && result!=3'b001))
        begin
            $display("***TEST_FAILED! bad output with light, result%b, result_prev%b", result, result_prev);
            err=1;
        end
        end
     end   
    //Todo: Finish test, check for success
    initial 
    begin
       #200
       if (err==0)
         $display("***TEST PASSED! :) ***");
       $finish;
    end
    //Todo: Instantiate counter module
	dice_light top(
	.rst (rst),
 	.clk (clk),
 	.button(button),
 	.sel (sel),
 	.result (result)
 	);
endmodule
