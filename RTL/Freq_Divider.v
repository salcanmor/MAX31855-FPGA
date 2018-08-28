`timescale 1ns / 1ps
`default_nettype none

module Freq_Divider#(
  parameter sys_clk = 50000000,	// 50 MHz system clock
				clk_out = 5000000		// 5Mhz Hz clock output
							)
  (Clk_in, Clk_out);

  // input ports
  input wire Clk_in;

  // output ports
  output reg Clk_out;
  
	 initial begin		//	Initialize Clk_out for simulation purposes
	 Clk_out=1'b0;
  end

  // counter size calculation according to input and output frequencies
  parameter max = sys_clk / (2*clk_out); // max-counter size. clk_out has 50% duty cycle

  localparam N=log2(max);	//	numbers of bits needed in the counter

  reg [N-1:0]counter = 0; // N-bit counter size

  always@(posedge Clk_in) begin
    if (counter == max-1)
      begin
        counter <= 0;
        Clk_out <= ~Clk_out;
      end
    else
      begin
        counter <= counter + 1'd1;
      end
  end

  //function to calculate the bits for the counter according to the size of M
  function integer log2(input integer n);
    integer i;
    begin
      log2=1;
      for (i=0; 2**i < n; i=i+1)
        log2=i+1;
    end

  endfunction

endmodule
