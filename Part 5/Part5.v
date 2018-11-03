// 
// Digital Logic Lab Part 5
// (c) Neil Nie
// Oct 31st, 2018
//


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

assign out[6] = (~in[3] & ~in[2] & ~in[1]) + (~in[3] & in[2] & in[1] & in[0]); 
assign out[5] = (in[3] & in[2] & ~in[1]) + (~in[3] & in[1] & in[0]) + (~in[3] & ~in[2] & in[0]) + (~in[3] & ~in[2] & in[1]); 
assign out[4] = (in[3] & in[2] & in[1]) + (~in[3] & ~in[2] & ~in[1] & ~in[0]) + (in[3] & in[2] & ~in[0]);
assign out[3] = (in[2] & in[1] & in[0]) + (~in[3] & in[2] & ~in[1] & ~in[0]) + (in[3] & ~in[2] & in[1] & ~in[0]) + (~in[2] & ~in[1] & in[0]);
assign out[2] = (in[3] & in[2] & ~in[0]) + (~in[3] & ~in[2] & in[1] & ~in[0]) + (in[3] & in[2] & in[1]);
assign out[1] = (in[2] & in[1] & ~in[0]) + (in[3] & in[1] & in[0]) + (~in[3] & in[2] & ~in[1] & in[0]) + (in[3] & in[2] & ~in[0]);
assign out[0] = (in[2] & ~in[1] & ~in[0]) + (in[3] & in[2] & ~in[1]) + (~in[3] & ~in[2] & ~in[1] & in[0]) + (in[3] & ~in[2] & in[1] & in[0]);

endmodule


module Part5(

	SW,
	HEX0,
	HEX1
);

// declare and assign all wires

input  [8:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;

wire [3:0] A;
wire [3:0] B;
wire c_0;
assign A = SW[3:0];
assign B = SW[7:4];
assign c_0 = SW[8];

// -------- the fun begins

reg [3:0] sum;
reg [3:0] z;
reg [3:0] s0;
reg c_1;

always @(A or B or c_0) begin 
	sum = A + B + c_0;
end

always @ (sum or z or c_1) begin
	if (sum > 10) begin
		z = 10;
		c_1 = 1;
	end else begin
		z = 0;
		c_1 = 0;
	end
	s0 = sum - z;
end

// -------- the fun ends

wire [6:0] display0;
wire [6:0] display1;

full_display(s0, display0);
half_display(c_1, display1);

assign HEX1 = display1;
assign HEX0 = display0;

endmodule
