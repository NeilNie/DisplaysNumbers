// 
// Digital Logic Lab Part 5
// (c) Neil Nie
// Oct 31st, 2018
//

module Part5(

	SW,
	HEX0,
	HEX1
);

input [8:0] SW;
output [6:0] HEX0;
output [6:0] HEX1;

wire [3:0] A;
wire [3:0] B;
wire       cin;

assign A = SW[3:0];
assign B = SW[7:4];
assign cin = SW[8];

// --------

wire S0;
integer T0;
integer z0;
integer c1;

assign T0 = A + B + Cin;

if (T0 > 9) begin
	assign Z0 = 10;
	assign c1 = 1;
end 
else begin
	assign Z0 = 0;
	assign c1 = 0;
end

assign S0 = T0 - Z0;

endmodule
