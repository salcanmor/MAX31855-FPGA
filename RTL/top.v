`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Description: Top level module containing an UART and a checker module.
//	The checker module, gets the bytes coming from the receiver module and 
// adds one bit. Doing this, we can check the receiver and the transmitter module
// of the UART.
// The baud rate generator is configured for a 50Mhz clock. It accepts input 
// parameters, as well as the rx and tx modules.
//
//////////////////////////////////////////////////////////////////////////////////
module top (clk, reset, SPI_clk, SPI_cs, SPI_Data_In, data_out);

    input wire clk;
    input wire reset;
	 
    input wire SPI_Data_In;
	 output wire SPI_clk;
	 output wire SPI_cs;

    output wire data_out;  





wire [31:0] SPI_Data_Out_bus;

wire [7:0] w_data_bus;
wire tx_start;
wire tx_ready;
wire tx_done_tick;

Freq_Divider Freq_Divider_unit (
    .Clk_in(clk), 
    .Clk_out(SPI_clk)
    );

uart uart_unit (
    .clk(clk), 
    .reset(reset), 
    .tx_start(tx_start), 
    .w_data(w_data_bus), 
    .data_out(data_out), 
    .tx_done_tick(tx_done_tick), 
    .tx_ready(tx_ready)
    );


SPI_Temp_Master2 SPI_Temp_Master2_unit (
    .clk_i(SPI_clk), 
    .SPI_clk(), 
    .SPI_cs(SPI_cs), 
    .SPI_Data_In(SPI_Data_In), 
    .SPI_Data_Out(SPI_Data_Out_bus)
    );


checker controller (
    .clk(clk), 
    .reset(reset), 
    .tx_ready(tx_ready), 
    .tx_done_tick(tx_done_tick), 
    .w_data(w_data_bus), 
    .tx_start(tx_start), 
    .read_buffer_in(SPI_Data_Out_bus), 
    .SPI_cs(SPI_cs)
    );



endmodule
