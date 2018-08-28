`timescale 1ns / 1ps

module SPI_Temp_Master2(
  clk_i,
  SPI_clk,
  SPI_cs,
  SPI_Data_In,
  SPI_Data_Out
);

  input clk_i;
  output SPI_clk;
  output SPI_cs;
  input SPI_Data_In;
  output reg [31:0] SPI_Data_Out;

//  wire clk_i;
//  wire SPI_clk;
//  wire SPI_cs;
//  wire SPI_Data_In;
//  reg [31:0] SPI_Data_Out;


  reg [31:0] SPI_rx_buff;
  reg [5:0] SPI_cnt = 6'b 000000;
  reg SPI_cs_sig = 1'b 0;

  assign SPI_cs = SPI_cs_sig;
  assign SPI_clk = clk_i;
  
  always @(posedge clk_i) begin
  
    //if(SPI_cnt == 35) begin							//
    if(SPI_cnt == 33) begin							//
      SPI_cnt <= {6{1'b0}};							//
    end														//		SECCIÓN 1
    else begin												//
      SPI_cnt <= SPI_cnt + 1'b1;							//
    end														//
	 
	 
    if(SPI_cnt < 2) begin								//
      SPI_cs_sig <= 1'b 0;								//
      SPI_rx_buff <= {32{1'b0}};						//
    end														//
   // else if(SPI_cnt < 34) begin						//
    else if(SPI_cnt < 32) begin						//
    
		SPI_rx_buff[31:0] <= {SPI_Data_In, SPI_rx_buff[31:1]};
	//	SPI_rx_buff[31:0] <= {SPI_rx_buff[30:0], SPI_Data_In};
	//	SPI_rx_buff[31:1] <= SPI_rx_buff[30:0];	//
   // SPI_rx_buff[0] <= SPI_Data_In;				//
      SPI_cs_sig <= 1'b 0;								//		SECCIÓN 2
    end														//
    //else if(SPI_cnt == 34) begin						//
    else if(SPI_cnt == 32) begin						//
      SPI_Data_Out[31:0] <= SPI_rx_buff[31:0];	//
      SPI_cs_sig <= 1'b 1;								//
    end														//
    else begin												//
      SPI_cs_sig <= 1'b 1;								//
    end														//
  end															//


endmodule
