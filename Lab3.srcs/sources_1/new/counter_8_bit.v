`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 01:59:39 AM
// Design Name: 
// Module Name: counter_8_bit
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


module counter_8_bit(input clk,rst,input [1:0] direction, input pause, input[7:0] maximum,output reg [7:0] count);


always @(posedge clk,posedge rst) begin
    if (rst) begin
        count<=0;
    end
    else if (pause==1)
        count=count;
    else begin
        if (direction ==2'b01) begin
            if (count==0) begin
                count<=maximum;
            end
            else count<=count-1;
        end
        else if (direction ==2'b10) begin
            if (count==maximum) begin
                count<=0;
            end
            else count<=count+1;
        end
        else count=count;
    end
end
    
    
endmodule
