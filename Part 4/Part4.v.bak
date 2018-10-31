// 
// Digital Logic Lab Part 2
// Neil Nie
// (c) Yongyang Nie
// Oct 30th, 2018
// 

// this only displays nothing or 1. 

module half_display(

	in,			// accepts a four bit input
	out			// returns a six bit output
);

input in; 			// A
output [6:0] out; // D C B A G 


assign out[6] = 1;
assign out[5] = 1; 
assign out[4] = 1;
assign out[3] = 1;
assign out[2] = ~in;
assign out[1] = ~in;
assign out[0] = 1;

endmodule

// full seven segment display module.

module full_display(

	in,			// accepts a four bit input
	out			// returns a six bit output
);

input [3:0] in; 	// A B C D
output [6:0] out; // G F E D C B A  

assign out[6] = (~in[3] & ~in[2] & ~in[1]) 	+ (~in[3] & in[2] & in[1] & in[0]); 
assign out[5] = (in[3] & in[2] & ~in[1]) 	+ (~in[3] & in[1] & in[0]) + (~in[3] & ~in[2] & in[0]) + (~in[3] & ~in[2] & in[1]); 
// double check 
assign out[4] = (~in[3] & in[0]) 		+ (~in[3] & in[2] & ~in[1]) + (~in[2] & ~in[1] & in[0]);
assign out[3] = (in[2] & in[1] & in[0]) 	+ (~in[3] & in[2] & ~in[1] & ~in[0]) + (in[3] & ~in[2] & in[1] & ~in[0]) + (~in[2] & ~in[1] & in[0]);
// double check
assign out[2] = (in[3] & in[2] & ~in[0]) 	+ (~in[3] & ~in[2] & in[1] & ~in[0]) + (in[3] & in[2] & in[1]);
// double check
assign out[1] = (in[2] & in[1] & ~in[0]) 	+ (in[3] & in[1] & in[0]) + (~in[3] & in[2] & ~in[1] & in[0]) + (in[3] & in[2] & ~in[0]);
assign out[0] = (in[2] & ~in[1] & ~in[0]) 	+ (in[3] & in[2] & ~in[1]) + (~in[3] & ~in[2] & ~in[1] & in[0]) + (in[3] & ~in[2] & in[1] & in[0]);

endmodule

module two_one_four_bit_mux(

	a,
	b,
	sel,
	out
);

input [3:0] a;
input [3:0] b;
output [3:0] out;
input sel;

assign out[3] = (~sel & a[3]) | (sel & b[3]);
assign out[2] = (~sel & a[2]) | (sel & b[2]);
assign out[1] = (~sel & a[1]) | (sel & b[1]);
assign out[0] = (~sel & a[0]) | (sel & b[0]);

endmodule

// returns 1 if in > 9
// returns 0 if in < 9

module comparator(

	in,
	out

);

input [3:0] in;
output out;

assign out = in[3] & (in[2] | in[1]);

endmodule

// this converter module convert number > 9 
// to the appropriate number

module converter(

	in,
	out
);

input [3:0] in;
output [3:0] out;

assign out[3] = 0;
assign out[2] = in[3] & in[2] & in[1];
assign out[1] = in[3] & in[2] & ~in[1];
assign out[0] = in[3] & in[0];

endmodule

module Part2(

	SW,
	HEX0,
	HEX1
);

input [3:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;

wire compare_out;
wire [3:0] convert_out;
wire [3:0] mux_out;
wire [6:0] display1;
wire [6:0] display0;

comparator(SW, compare_out);
converter(SW, convert_out);

two_one_four_bit_mux(SW, convert_out, compare_out, mux_out);
full_display(mux_out, display0);
half_display(compare_out, display1);

assign HEX0 = display0;
assign HEX1 = display1;

endmodule


