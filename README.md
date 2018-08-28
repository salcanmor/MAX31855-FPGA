# MAX31855-FPGA
Project to make the MAX31855 work in an FPGA and verify its behaviour.

In this project and video, I'm using a Xilinx Spartan6, to read the MAX31855 data (through SPI).
Then, that data is sent to the PC (Matlab) through UART.
A Matlab script, receive the data and convert it into readable numbers. :)

The data received from the MAX31855 is checked as well using a logic analyzer.

Matlab usage: MAX31855(COM PORT NUMBER, BAUD RATE). Ex.: MAX31855(6,9600)

Demonstration video (Spanish): https://youtu.be/zYGanct1aHk
