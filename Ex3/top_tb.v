//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Bernabeu Antoine
// Date: 09/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each
// control signal?). Don't try to test everything at once - validate one part of
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );

    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg enable;
    reg direction;
    reg err;
    reg [7:0] counter_out;
    reg [7:0] counter_prev;


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
       enable=0;
       direction=0;
       rst=0;
       #5
       forever begin
	  #5
	  rst=1;
	  #5
	  //Testing reset
	  if(counter_out!=0)
	begin
			$display("***TEST_FAILED! reset doesn't work");
			err=1;
	end
	#5
	//Testing counter up
	rst=0;
	enable=1;
	direction=1;
	counter_prev=counter_out;
	#1
	if(counter_prev+1!=counter_out)
	begin
		$display("***TEST_FAILED! counter up doesn't work");
		err=1;
	end
	#5
	//Testing counter_down
	rst=0;
	enable=1;
	direction=0;
	counter_prev=counter_out;
	#1
	if(counter_prev-1!=counter_out)
	begin
		$display("***TEST_FAILED! counter down doesn't work");
	end
	#5
	//Testing freeze
	rst=0;
	enable=0;
	direction=1;
	counter_prev=counter_out;
	#1
	if(counter_prev!=counter_out)
	begin
		$display("***TEST_FAILED! counter freeze doesn't work");
		err=1;
	end
	end
    end		
    //Todo: Finish test, check for success
    initial 
    begin
       #50
       if (err==0)
         $display("***TEST PASSED! :) ***");
       $finish;
    end

	//Todo: Instantiate counter module
	counter top (
 	.clk (clk),
 	.rst (rst),
 	.enable (enable),
 	.direction (direction),
 	.counter_out (counter_out)
 	);
endmodule
