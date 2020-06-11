//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Bernabeu Antoine
// Date: 10/06/2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);
    //Todo: Parameters
    parameter CLK_PERIOD = 10;
    
    //Todo: Regitsers and wires
    reg err;
    reg [2:0]a;
    reg [2:0]b;
    reg enable;
    reg clk;
    
    wire [5:0]result;
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
        err=0;
        enable=1;
        a=0;
        b=0;
        #CLK_PERIOD
        if(result!=0)
            begin
                $display("***TEST_FAILED! 0x0!=result%d",result);
                err=1;
            end
        a=6;
        b=0;
        #CLK_PERIOD
        forever
        begin
            //Testing table of 6
            #CLK_PERIOD
            if(result!=(a*b))
                begin
                    $display("***TEST_FAILED! a%d*b%d!=result%d",a,b,result);
                    err=1;
                end
            b=b+1;
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
	multiplier top(
 	.clk (clk),
 	.enable(enable),
 	.a (a),
 	.b (b),
 	.result (result)
 	);
endmodule       