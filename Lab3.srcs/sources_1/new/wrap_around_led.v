`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 10:51:49 PM
// Design Name: 
// Module Name: wrap_around_led
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


module wrap_around_led(input clk,rst, input [1:0] direction, input pause, input [7:0] maximum, output reg [3:0] leds );
reg [1:0] state;
wire [7:0] count;
parameter S0 =2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
wire slow_clock;
wire [7:0] counter_maximum;
reg [1:0] counter_direction;


assign counter_maximum= (maximum==7'd0)?7'd0:maximum -1;

clk_divider_1Hz clk1(clk,rst,slow_clock);
counter_8_bit count1(slow_clock,rst,counter_direction ,pause,counter_maximum,count);



always @(direction) begin
  if (direction ==2'b00) counter_direction=2'b00;
    else if (direction == 2'b11) counter_direction =2'b11;
    else counter_direction =2'b01;

end
always@(posedge slow_clock,posedge rst) begin
    if (rst) begin
        state=S0;
        leds=4'b0;
    end
    else if (pause) begin
        state<=state;
        leds<=leds;
    end
    else begin
        case(state) 
            S0:begin
                if(direction==2'b01 && count==0) begin
                    leds=4'b1000;
                    state=S1;
                end
                else if (direction==2'b10 && count==counter_maximum) begin
                    leds=4'b0001;
                    state=S2;
                end
            end
            S1:begin
                if(direction==2'b10) state=S2;
                else begin
                    if(count==0)begin
                        if(leds==4'b0001) begin
                            leds=4'b0000;
                            state=S0;
                        end
                        else leds=leds>>1;
                    end
                end
            end
            S2:begin
                if(direction==2'b01) state=S1;
                else begin
                    if(count==counter_maximum) begin
                        if(leds==4'b1000) begin
                            leds=4'b0000;
                            state=S0;
                        end
                        else leds=leds<<1;
                    end
                end
            end
        endcase
    end
end
endmodule