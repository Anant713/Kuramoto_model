 module upcount4 (clk, Resetn, E, Q);
	 input clk, Resetn, E;
	 output [3:0] Q;
	 reg [3:0] Q;
	 always @(posedge Clock or negedge Resetn)
	 if (Resetn == 0)
	 Q<=0;
	 else if (E)
	 Q<=Q+1;
 endmodule
 