`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2021 12:40:39 AM
// Design Name: 
// Module Name: wrap_around_test
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


module wrap_around_test;
reg clk,rst,pause;
reg[1:0] direction;
reg[7:0] maximum;
wire [3:0] leds;

wrap_around_led wrap_test(clk,rst,direction,pause,maximum,leds);
initial begin
rst=1;
clk=0;
direction=2'b01;
pause=0;
maximum=5;
#10;
rst=0;
#100;
pause=1;
#300;
pause=0;
direction=2'b10;
maximum=8;
#3000;
direction=2'b11;

end
always #5 clk=~clk;
endmodule

