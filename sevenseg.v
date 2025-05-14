module sevenseg (SW, LEDR, HEX1, HEX0);
	input [7:0] SW;
	output [7:0] LEDR;	
	output [0:6] HEX1, HEX0;

	assign LEDR = SW;

	// drive the displays through 7-seg decoders
	bcd7seg digit1 (.B(SW[7:4]), .H(HEX1));
	bcd7seg digit0 (.B(SW[3:0]), .H(HEX0));
	
endmodule
			
module bcd7seg (B, H);
	input [3:0] B;
	output [0:6] H;

	wire [0:6] H;
	
assign H[0] = (~B[3] & B[2] & ~B[1] & ~B[0]) | (~B[3] & ~B[2] & ~B[1] & B[0]);
	assign H[1] = (B[2] & ~B[1] & B[0]) | (B[2] & B[1] & ~B[0]);
	assign H[2] = (~B[2] & B[1] & ~B[0]);
	assign H[3] = (~B[3] & ~B[2] & ~B[1] & B[0]) | (~B[3] & B[2] & ~B[1] & ~B[0]) | (~B[3] & B[2] & B[1] & B[0]);
	assign H[4] = (~B[1] & B[0]) | (~B[3] & B[0]) | (~B[3] & B[2] & ~B[1]);
	assign H[5] = (B[1] & B[0]) | (~B[2] & B[1]) | (~B[3] & ~B[2] & B[0]);
	assign H[6] = (B[2] & B[1] & B[0]) | (~B[3] & ~B[2] & ~B[1]);
endmodule

