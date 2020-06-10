//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Bernabeu Antoine
// Date: 09/06/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module tlc_module(
    input clk,
    output reg red,
    output reg amber,
    output reg green
    );
    
    reg red_state=1'b1;
    reg amber_state=1'b1;
    reg green_state=1'b1;
    
    always @(clk)
    begin
        red=red_state;
        amber=amber_state;
        green=green_state; 
    end
    
    always @(clk,red,amber,green)
    begin
        case(red)
            1'b1:
                if(green==1'b1)
                begin
                    red_state=1'b1;
                    amber_state=1'b0;
                    green_state=1'b0;
                end
                else
                    if(amber==1'b1)
                    begin
                        red_state=1'b0;
                        amber_state=1'b0;
                        green_state=1'b1;
                    end
                    else
                    begin
                        red_state=1'b1;
                        amber_state=1'b1;
                        green_state=1'b0;
                        end
             1'b0:
                if(green==1'b1)
                    if(amber==1'b1)
                    begin
                        green_state=1'b0;
                        amber_state=1'b0;
                        red_state=1'b1;
                    end
                    else
                        begin
                            green_state=1'b0;
                            amber_state=1'b1;
                            red_state=1'b0;
                        end
                  else
                    if(amber==1'b1)
                    begin
                        red_state=1'b1;
                        amber_state=1'b0;
                        green_state=1'b0;
                    end
                    else
                    begin
                        red_state=1'b1;
                        amber_state=1'b0;
                        green_state=1'b0;
                    end                                  
        endcase
    end
    
 endmodule
