module regn (D,clk,resetn,Q);
	parameter n = 16;
	input[n-1:0] D;
	input clk,resetn;
	output[n-1:0] Q;
	reg [n-1:0] Q;
	always @(negedge resetn or posedge clk)
		if(!resetn)
			Q <= 0;
		else
			Q <= D;
endmodule
	