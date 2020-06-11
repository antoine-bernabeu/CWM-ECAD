//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Bernabeu Antoine
// Date: 09/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg button;
    
    reg err;
    reg [2:0]throw_prev;
    wire [2:0] throw;
	
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
        rst=0;
        err=0;
        button=0;
        #5
        //Testing Initialisation
        if(throw!=3'b001)
	begin
		$display("***TEST_FAILED! INIT");
		err=1;
	end
    //Testing incrementation
    forever begin
      throw_prev=throw;
      #CLK_PERIOD  
      if(throw_prev==3'b111)
        if(throw!=3'b001)
        begin
            $display("***TEST_FAILED! after 7, not going to 1");
            err=1;
        end 
      else
        if(throw!=throw_prev+1)
        begin
            $display("***TEST_FAILED! increment");
            err=1;
        end
       #10
       rst=1;
       if(throw!=3'b000)
       begin
            $display("***TEST_FAILED reset");
            err=1;
       end
       #5
       throw_prev=throw;
       button=0;
       #CLK_PERIOD
       if(throw_prev==3'b000 ||throw_prev==3'b111)
            if(throw!=3'b001)
            begin
                $display("***TEST_FAILED! edge with button 0");
                err=1;
            end
        else
            if(throw!=throw_prev)
            begin
                $display("***TEST_FAILED freeze dice");
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
	dice top(
 	.clk (clk),
 	.rst (rst),
 	.button (button),
 	.throw (throw)
 	);
endmodule
