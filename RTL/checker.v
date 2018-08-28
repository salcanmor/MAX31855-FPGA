`timescale 1ns / 1ps

module checker
  ( 
    input wire clk,
    input wire reset,
    input wire tx_ready,
    input wire tx_done_tick,
    //input wire rx_done_tick,
    //input wire [7:0] r_data,
    output reg [7:0] w_data,
    output reg tx_start	,
	 input wire [31:0] read_buffer_in,
	 input wire SPI_cs


  );



  // state declaration for the FSM
  localparam [2:0]
  idle_and_receive    = 3'b110,
  byte1 					 = 3'b000,
  byte2 					 = 3'b001,
  byte3 					 = 3'b010,
  byte4 					 = 3'b011,
  parada 					 = 3'b100,
  espera 					 = 3'b101;

  //	signal declaration
  reg [2:0] state_reg;
  //reg [7:0] rx_buffer;

  //reg [31:0] read_buffer = 32'b01100011_01100001_01110011_01100001;
  reg [31:0] read_buffer ;
  reg [26:0] counter_wait;
  reg [3:0] counter_div;



  always@(posedge clk, posedge reset)

    if(reset)begin
      state_reg<=byte1;
      tx_start<=0;
      counter_wait<=0;
    end
  else 

    case (state_reg)

      byte1:
        begin
		  		read_buffer [31:0]<=read_buffer_in[31:0];
		  if(SPI_cs)begin
          if(tx_ready)begin
            tx_start<=1;
            w_data<=read_buffer[31:24];			 
            state_reg<=byte2;
          end
        end
		 end

      byte2:
        begin
          if(tx_done_tick)begin

            tx_start<=1;
            w_data<=read_buffer[23:16];			 
            state_reg<=byte3;end
        end

      byte3:
        begin
          if(tx_done_tick)begin

            tx_start<=1;
            w_data<=read_buffer[15:8];			 
            state_reg<=byte4;end
        end

      byte4:
        begin
          if(tx_done_tick)begin

            tx_start<=1;
            w_data<=read_buffer[7:0];			 
            state_reg<=parada;
          end
        end

      parada:begin

        if(tx_ready)begin

          tx_start<=0;
          state_reg<=espera;end

      end

      espera:
        begin
          counter_wait <= counter_wait + 1'b1;

          if(counter_wait[26])begin
            state_reg<=byte1;
            counter_wait<=0;
          end

        end

    endcase

  endmodule
