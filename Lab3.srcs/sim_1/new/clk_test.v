`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 01:58:46 AM
// Design Name: 
// Module Name: clk_test
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


module clk_test;

reg clk,rst;
wire clk_div;

clk_divider_1Hz clk_test(clk,rst,clk_div);

initial begin
clk=0;
rst=1;
#10;rst=0;
forever #5 clk=~clk;

end

endmodule

