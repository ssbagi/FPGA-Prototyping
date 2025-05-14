module SEG (SW, HEX0, HEX1);
	input [1:0] SW;				// input code
	output [0:6] HEX0, HEX1;	// output 7-seg code

	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */
	// the following equations describe display functions in cannonical SOP form
	assign HEX0[0] = ~(~SW[1] & SW[0]); 
	assign HEX0[1] = SW[0];
	assign HEX0[2] = SW[0];
	assign HEX0[3] = SW[1];
	assign HEX0[4] = SW[1];
	assign HEX0[5] = ~(~SW[1] & SW[0]); 
	assign HEX0[6] = SW[1];
	
	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */
	// the following equations describe display functions in SOP form
	assign HEX1[0] = ~((~SW[1] & SW[0]) | (SW[1] & ~SW[0])); 
	assign HEX1[1] = SW[0];
	assign HEX1[2] = SW[0] | SW[1];
	assign HEX1[3] = SW[0] & SW[1];
	assign HEX1[4] = SW[0] & SW[1];
	assign HEX1[5] = ~(~SW[1] & SW[0]); 
	assign HEX1[6] = SW[0] & SW[1];

endmodule