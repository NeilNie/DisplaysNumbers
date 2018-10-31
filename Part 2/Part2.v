// 
// Digital Logic Lab Part 2
// Neil Nie
// (c) Yongyang Nie
// Oct 30th, 2018
// 

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

assign out = (~sel & a) | (sel & b);

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

comparator(SW, compare_out);
converter(SW, convert_out);

two_one_four_bit_mux(SW, convert_out, compare_out, mux_out);



endmodule


