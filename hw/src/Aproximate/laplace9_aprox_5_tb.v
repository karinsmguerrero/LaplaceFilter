`timescale 1ns / 10ps

module laplace9_aprox_5_tb();

parameter ROWS = 510;
parameter COLS = 510;

	reg [7:0] b;
	reg [7:0] d;
    reg [7:0] e;
    reg [7:0] f;
    reg [7:0] h;
	wire [7:0] s;

	integer row,col;
	integer file;
	reg [7:0] pixel = 0;
	
	reg [7:0] img [0:262143];

	laplace9_aprox_5 DUT (.b(b), .d(d), .e(e), .f(f), .h(h), .s(s));

	initial begin
		$display("--- Beginning simulation ---");
		
		$readmemb("../../sw/image.txt", img);
		file = $fopen("imageFiltered_aprox_5.txt","w");

		for(row = 0; row < ROWS; row = row + 1) begin
			for (col = 0; col < COLS; col = col + 1) begin
				b = img[(col + 1) + (row * 512)]; 
				d= img[col + ((row + 1) * 512)];
				e= img[(col + 1) + ((row + 1) * 512)];
				f= img[(col + 2) + ((row + 1) * 512)];
				h= img[(col + 1) + ((row + 2) * 512)];
				#10
				$fwrite(file,"%b\n", s);
			end
		end
		
		$fclose(file);
		$display("-- Ending simulation --");
		$finish;
	end

endmodule
