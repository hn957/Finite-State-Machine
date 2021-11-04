`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 01:56:51 AM
// Design Name: 
// Module Name: clk_divider_1Hz
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


module clk_divider_1Hz( input clk,reset, output reg slow_clock);
 parameter LIMIT=50000000; 
 //parameter LIMIT=5; 
 reg [32:0] counter=0;
    
    always@(posedge clk, posedge reset)begin
      if (reset) begin
        counter <=0;
        slow_clock <=0;
      end else begin  
        if(counter==(LIMIT-1))begin
            counter         <= 0;
            slow_clock      <= ~slow_clock;    
        end
        else begin
            counter         <= counter + 1;
            end
         end   
    end

endmodule
