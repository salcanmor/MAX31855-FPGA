`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:16 03/10/2018
// Design Name:   SPI_Temp_Master2
// Module Name:   C:/Users/Salva-i7/Documents/mi FPGA/XC6SLX9 Mini Board Documents/XC6SLX9 Mini Board Examples-Verilog/UART_max/TB_SPI_Temp_Master2.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_Temp_Master2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_SPI_Temp_Master2;

	// Inputs
	reg clk_i;
	reg SPI_Data_In;

	// Outputs
	wire SPI_clk;
	wire SPI_cs;
	wire [31:0] SPI_Data_Out;

	// Instantiate the Unit Under Test (UUT)
	SPI_Temp_Master2 uut (
		.clk_i(clk_i), 
		.SPI_clk(SPI_clk), 
		.SPI_cs(SPI_cs), 
		.SPI_Data_In(SPI_Data_In), 
		.SPI_Data_Out(SPI_Data_Out)
	);

reg [31:0] data;
integer i;

	initial begin
		// Initialize Inputs
		clk_i = 0;
		SPI_Data_In = 0;
		data = 40'b1001010001000010001000010010000000000111;
		i=-1;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
			always@(posedge clk_i)begin
		#10; 
		SPI_Data_In = data >> i;
		i = i + 1;
	end
      
		always #5 clk_i = ~clk_i;
		
		
		
		
		
		
		
/*	// Inputs
	reg Clk_in;
	reg reset;

	// Outputs
	wire Clk_out;

	// Instantiate the Unit Under Test (UUT)
	Freq_Divider freq (
		.Clk_in(Clk_in), 
		.Clk_out(Clk_out), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		Clk_in = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10;
		reset=0;
	
	end
      
		always #5 Clk_in = ~Clk_in;	*/	
		

		
endmodule



