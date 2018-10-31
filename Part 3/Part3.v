//
// Digital Logic Lab Part 3
// Ripple Carry Adder
// (c) Neil Nie
// Oct 31st, 2018
// 

module full_adder(

	a,
	b,
	out,
	cin,
	cout
);

input a;
input b;
input cin;
output out;
output cout;

assign cout = (a & b) | cin & (~a & b | ~b & a);
assign out = cin & ~a & ~b | ~cin & ~a & b | cin & a & b | ~cin & a & ~b;

endmodule

module Part3(

	SW,
	LEDR

);

input [7:0] SW;
output [3:0] LEDR;

endmodule
