`timescale 1ns / 10ps

module laplace4_tb();

	parameter ROWS = 512;
	parameter COLS = 512;

	reg [7:0] b;
	reg [7:0] d;
	reg [7:0] e;
	reg [7:0] f;
	reg [7:0] h;
	wire [7:0] s;

	integer k;
	integer file;
	reg [7:0] pixel = 0;
	
	reg [7:0] img [0:262143];

	laplace4 DUT (.b(b), .d(d), .e(e), .f(f), .h(h), .s(s));

	initial begin
		$display("--- Beginning simulation ---");
		
		$readmemb("../../sw/image.txt", img);
		file = $fopen("imageFiltered.txt","w");

		for (k = 0; k < ROWS*COLS; k = k + 1) begin
			#10
			pixel = img[k];
			$fwrite(file,"%b\n",pixel);
		end
		
		$fclose(file);
		$display("-- Ending simulation --");
		$finish;
	end

endmodule
