module laplace9_exact (
	input [7:0] b,
	input [7:0] d,
	input [7:0] e,
	input [7:0] f,
	input [7:0] h,
	output [9:0] s
);
	wire laplace, cin, cin2, cout, cout1, cout2, cout3, res10, res2, res3, res4;
	wire [7:0] res1;

    RippleCarryAdder rc1 (b, d, 1'b0, res1, cout);
    //RippleCarryAdder rc2 (f, h, 0, res2, cout2);
    //RippleCarryAdder rc3 (res1, res2, 0, res3, cout3);
    assign s = {1'b1, 1'b1, res1};
	// assign laplace = (b + d + f + h) - (4*e);
	// b + d -> 9 b
	// f + h -> 9 b
	// assign s = (laplace > 255) ? 255 : (laplace < 0) ? 0 : laplace;
endmodule




