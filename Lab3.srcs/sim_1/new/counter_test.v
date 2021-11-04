`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 02:11:31 AM
// Design Name: 
// Module Name: counter_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_test;
reg clk,rst,  pause;
reg[1:0] direction;
reg[7:0] maximum;
wire [7:0] count;

counter_8_bit count_test(clk,rst,direction,pause,maximum,count);

initial begin
rst=1;
clk=0;
direction=2'b01;
pause=0;
maximum=20;
#10;
rst=0;
#100;
pause=1;
#30;
pause=0;
direction=2'b10;
maximum=40;

end
always #5 clk=~clk;
endmodule
