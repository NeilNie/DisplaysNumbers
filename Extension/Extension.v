//
//
// Extension project for Lab 2
// Four bit subtractor & adder
// 
// Neil Nie
// (c) Nov 1st, 2018
//

module Extension(

	SW,
	HEX0,	// second digit sum
	HEX1,	// first digit sum
	HEX4,	// second digit second number
	HEX5,	// first digit second number
	HEX6,	// second digit first number
	HEX7, // first digit first number
);

input [8:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX4;
output [6:0] HEX5;
output [6:0] HEX6;
output [6:0] HEX7;

endmodule
