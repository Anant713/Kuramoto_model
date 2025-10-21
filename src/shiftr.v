module shiftr(resetn, w, clk,Q);
	parameter m=4;
	input resetn,w,clk;
	output [1:m] Q ;
	integer k;
	reg [1:m] Q;
	
	always @(negedge resetn or posedge clk)
		if (!resetn)
			Q <= 0 ;
		else
			begin
				for (k=m;k>1;k=k-1)
					Q[k] <= Q[k-1];
				Q[1] <= w ;
			end
endmodule ``