module laplace4 (
	input [7:0] b,
	input [7:0] d,
	input [7:0] e,
	input [7:0] f,
	input [7:0] h,
	output [7:0] s
);
	wire laplace;

	assign laplace = (b + d + f + h) - (4*e);
	// b + d -> 9 b
	// f + h -> 9 b
	assign s = (laplace > 255) ? 255 : (laplace < 0) ? 0 : laplace;
endmodule
