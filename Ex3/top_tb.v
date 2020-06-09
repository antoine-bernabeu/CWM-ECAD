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
reg clk, rst, enable, direction, err;
reg [7:0] counter;
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
  rst=1;
  counter=0;
  counter_prev=counter;
  enable=0;
  direction=0;

  #20
  if(counter!=0)
    begin
    $display("***TEST_FAILED! counter not 0 with rst=1 and enable=0")
    err=1;
    end
  // Testing counter up
  direction=1;
  rst=0;
  enable=1;
  counter_prev=counter;

  #CLK_PERIOD
  if(counter_prev!=counter-1)
  begin
    $display("TEST_FAILED! counter up not working correctly")
    err=1;
  end

  #10
  //Testing counter down
  direction=0;
  rst=0;
  enable=1;
  counter_prev=counter;

  #CLK_PERIOD
  if(counter_prev!=counter-1)
  begin
    $display("TEST_FAILED! counter down not working correctly")
    err=1;
  end

  #10
  //Testing enable=0
  direction=0;
  rst=0;
  enable=0;
  counter_prev=counter;

  #CLK_PERIOD
  if(counter_prev!=counter)
  begin
    $display("TEST_FAILED! enable=0 doesn't stop counter")
    err=1;
  end

//Todo: Finish test, check for success
initial begin
  #50
  if (err==0)
    $display("***TEST PASSED! :) ***");
  $finish;
end

//Todo: Instantiate counter module
mux top (
 .clk (clk),
 .rst (rst),
 .enable (enable),
 .direction (direction),
 .counter_out (counter)
 );
endmodule
