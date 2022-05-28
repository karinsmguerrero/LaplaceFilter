`timescale 1ns / 10ps

module laplace9_exact_tb();

	reg [7:0] b;
	reg [7:0] d;
    reg [7:0] e;
    reg [7:0] f;
    reg [7:0] h;

	wire [9:0] s;

	integer i,j;
	integer file;

	laplace9_exact DUT (b,d,e,f,h,s);

	initial begin
		$display("--- Beginning simulation ---");

		file = $fopen("output_RippleCarryAdder.txt","w");

		b = 255; d = 255; e=255; f=255; h = 255;
		#10;
        $fwrite(file,"%b\n",s);
		
		$fclose(file);
		$display("-- Ending simulation --");
		$finish;
	end

endmodule
