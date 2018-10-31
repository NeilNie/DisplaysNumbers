// 
// Digital Logic Display & Number Lab
// Part 1
// Neil Nie
// (c) Oct 28th, 2018. 
// 

module seven_segment_display(

	in,			// accepts a four bit input
	out			// returns a six bit output
);

input [3:0] in; 	// A B C D
output [6:0] out; // D C B A G 

// waiting to be implemented

assign out[6] = (~in[3] & ~in[2] & ~in[1]) 	+ (~in[3] & in[2] & in[1] & in[0]); 
assign out[5] = (in[3] & in[2] & ~in[1]) 		+ (~in[3] & in[1] & in[0]) + (~in[3] & ~in[2] & in[0]) + (~in[3] & ~in[2] & in[1]); 
assign out[4] = (~in[3] & in[0]) 				+ (~in[3] & in[2] & ~in[1]) + (~in[2] & ~in[1] & in[0]);
assign out[3] = (in[2] & in[1] & in[0]) 		+ (~in[3] & in[2] & ~in[1] & ~in[0]) + (in[3] & ~in[2] & in[1] & ~in[0]) + (~in[2] & ~in[1] & in[0]);
assign out[2] = (in[3] & in[2] & ~in[0]) 		+ (~in[3] & ~in[2] & in[1] & ~in[0]) + (in[3] & in[2] & in[1]);
assign out[1] = (in[2] & in[1] & ~in[0]) 		+ (in[3] & in[1] & in[0]) + (~in[3] & in[2] & ~in[1] & in[0]) + (in[3] & in[2] & ~in[0]);
assign out[0] = (in[2] & ~in[1] & ~in[0]) 	+ (in[3] & in[2] & ~in[1]) + (~in[3] & ~in[2] & ~in[1] & in[0]) + (in[3] & ~in[2] & in[1] & in[0]);

endmodule

module Part1(

	SW,
	HEX0,
);

input [3:0] SW;
output [6:0] HEX0;

wire [6:0] out;

seven_segment_display(SW, out);

assign HEX0 = out;

endmodule
