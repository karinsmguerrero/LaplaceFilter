module laplace9_aprox_5 (
	input [7:0] b,
	input [7:0] d,
	input [7:0] e,
	input [7:0] f,
	input [7:0] h,
	output [7:0] s
);
	wire cout, cout1, cout2, cout3, cout4;
	wire [7:0] res1, res2, res3, res4, epor4, laplace;
	wire [9:0] sum;

	// b + d -> 9 b
    LSB_Four_AproximateRCAdder rc1 (b, d, 1'b0, res1, cout1);
	// f + h -> 9 b
    LSB_Four_AproximateRCAdder rc2 (f, h, 1'b0, res2, cout2);
	//(b + d) + (f + h) -> 9 b
    LSB_Four_AproximateRCAdder rc3 (res1, res2, 1'b0, res3, cout3);
	FullAdder fa1 (cout1, cout2, cout3, cout, cout4);
	//(b + d + f + h) -> 10 b
    assign sum = {cout4, cout, res3};
	assign epor4 = {e[5:0], 2'b00};
	assign laplace = sum - epor4;
	assign s = (laplace > 255) ? 255 : (laplace < 0) ? 0 : laplace;
	
endmodule




