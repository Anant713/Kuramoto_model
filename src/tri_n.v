module trin( Y,E,F );
	parameter n=4 ;
	input [n-1:0] Y;
	output [n-1:0] F;
	input E;
	wire [n-1:0] F ;
	assign F = E ? Y : 'bz ;
endmodule
