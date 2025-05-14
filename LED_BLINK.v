`timescale 1ns/1ns
module LED_BLINK(clk, clk_div, LED_EN, SW1, SW2, LED_OUT);
input clk, LED_EN, SW1, SW2;
output reg [7:0] LED_OUT;
output clk_div;
reg [1:0] X;
reg [7:0] LED_F   = 8'b00000001;
reg [7:0] LED_F1 = 8'b11111110;
reg [7:0] LED_F2 = 8'b00000101;
reg [7:0] LED_F3 = 8'b10100000;
//wire LED_INIT=8'b00000001;
 
always @(posedge clk)
begin
X={SW1,SW2};

if (LED_EN && X==0)
begin
LED_OUT[7:0] <= LED_F;
LED_OUT[7:0] <= LED_F <<1;
LED_OUT[0] <= LED_F[7];
LED_F <= LED_OUT;
end


else if(LED_EN && X==1)
begin
LED_OUT[7:0] <= LED_F3;
LED_OUT[7:0] <= LED_F3<<1;
LED_OUT[0] <= LED_F3[7];
LED_F1 <= LED_OUT;
end

else if(LED_EN && X==2)
begin
LED_OUT[7:0] <= LED_F1;
LED_OUT[7:0] <= LED_F1 <<1;
LED_OUT[0] <= LED_F1[7];
LED_F1 <= LED_OUT;
end

else if(LED_EN && X==3)
begin
LED_OUT[7:0] <= LED_F1;
LED_OUT[7:0] <= LED_F1 <<1;
LED_OUT[0] <= LED_F1[7];
LED_F1 <= LED_OUT;
end
end
endmodule

module LED_BLINK_tb();
reg clk, LED_EN, SW1, SW2;
wire [7:0] LED_OUT;
wire clk_out;

LED_BLINK GA1 (clk, clk_div, LED_EN, SW1, SW2, LED_OUT);

initial 
begin
clk=1'b0;
$monitor($time, "clk=%b,LED_EN=%b,SW1=%b,SW2=%b,LED_OUT=%b",clk,LED_EN,SW1,SW2,LED_OUT);
end

always
begin
#5 clk = ~(clk);
end

initial
begin
#2 LED_EN = 1; SW1=0; SW2=0;
#400 $stop;
#2 LED_EN = 1; SW1=1; SW2=1;
#400 $stop;
end
endmodule




