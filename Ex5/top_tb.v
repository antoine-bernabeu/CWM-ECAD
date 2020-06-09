//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Bernabeu Antoine
// Date: 09/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module top_tb(
    );
    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Regitsers and wires
    reg clk;
    reg red_state;
    reg amber_state;
    reg green_state;
    
    reg err;
    wire red;
    wire amber;
    wire green;
	
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
    red_state=0;
    amber_state=0;
    green_state=0;
        forever begin
        red_state=red;
        amber_state=amber;
        green_state=green;
        #CLK_PERIOD
        if((red==1'b0 && amber==1'b0 && green==1'b0) || (red==1'b1 && amber==1'b1 && green==1'b1) || (red==1'b1 && amber==1'b0 && green==1'b1) || (red==1'b0 && amber==1'b1 && green==1'b1))
            begin
                $display("***TEST_FAILED! Invalid State");
                err=1;
            end
        else
            if(red_state==1'b0 && amber_state==1'b0 && green_state==1'b1)
                if(red!=1'b0 && amber!=1'b1 && green!=1'b0)
                    begin
                        $display("***TEST FAILED! Invalid State after green light");
                        err=1;
                    end
             else if(red_state==1'b0 && amber_state==1'b1 && green_state==1'b0)
                if(red!=1'b1 && amber!=1'b0 && green!=1'b0)
                    begin
                        $display("***TEST_FAILED! Invalide State after amber light");
                        err=1;
                    end
              else if(red_state==1'b1 && amber_state==1'b0 && green_state==1'b0)
                if(red!=1'b1 && amber!=1'b1 && green!=1'b0)
                    begin
                        $display("***TEST_FAILED! Invalide State after red light");
                        err=1;
                    end
               else if(red_state==1'b1 && amber_state==1'b1 && green_state==1'b1)
                if(red!=1'b0 && amber!=1'b0 && green!=1'b1)
                    begin
                        $display("***TEST_FAILED! Invalide State after red and amber light");
                        err=1;
                    end
          end
      end
    //Todo: Finish test, check for success
    initial 
    begin
       #100
       if (err==0)
         $display("***TEST PASSED! :) ***");
       $finish;
    end

	//Todo: Instantiate counter module
	tlc top(
 	.clk (clk),
 	.red(red),
 	.amber (amber),
 	.green (green)
 	);
endmodule