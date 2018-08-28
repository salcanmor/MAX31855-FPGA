`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:22:34 03/17/2018
// Design Name:   top
// Module Name:   C:/Users/Salva-i7/Documents/mi FPGA/XC6SLX9 Mini Board Documents/XC6SLX9 Mini Board Examples-Verilog/UART_max/TB_top2.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_top2;

	// Inputs
	reg clk;
	reg reset;
	reg SPI_Data_In;

	// Outputs
	wire SPI_clk;
	wire SPI_cs;
	wire data_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset), 
		.SPI_clk(SPI_clk), 
		.SPI_cs(SPI_cs), 
		.SPI_Data_In(SPI_Data_In), 
		.data_out(data_out)
	);
reg [31:0] data;
integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		SPI_Data_In = 0;
		data = 97'b1111111111100100101010100100101000100001000100001001000000000011111111111111110001011111110111111;
		i=-1;
		// Wait 100 ns for global reset to finish
		#100;
        		reset =0;

		// Add stimulus here

	end

	always@(posedge clk)begin
		#100; 
		SPI_Data_In = data >> i;
		i = i + 1;
	end
	
			always #5 clk = ~clk;

      
endmodule

