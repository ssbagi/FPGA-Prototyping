module counter (CLOCK_50,SW,LEDR);
input CLOCK_50,SW;
output reg [3:0] LEDR;
reg [25:0] clkdiv;
always @ (posedge CLOCK_50)
begin
if (clkdiv ==26'b1011_1110_1011_1100_0010_0000_00)
begin 
if (SW)
LEDR <= 4'b0;
else
LEDR <= LEDR +1'b1;
clkdiv <= 26'b0;
end
else
clkdiv = clkdiv + 1;
end
endmodule
