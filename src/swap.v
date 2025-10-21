 module swap (Data, Resetn, w, clk, Extern, RinExt, BusWires);
 input [7:0] Data;
 input Resetn, w, clk, Extern;
 input [1:3] RinExt;
 output [7:0] BusWires;
 tri [7:0] BusWires;
 wire [1:3] Rin, Rout, Q;
 wire [7:0] R1, R2, R3;
 shiftr control (Resetn, w, Clock, Q);
	defparam control.m = 3;
 assign Rin[1] = RinExt[1] | Q[3];
 assign Rin[2] = RinExt[2] | Q[2];
 assign Rin[3] = RinExt[3] | Q[1];
 assign Rout[1] = Q[2];
 assign Rout[2] = Q[1];
 assign Rout[3] = Q[3];
 regn reg_1(BusWires, Rin[1], Clock, R1);
 regn reg_2(BusWires, Rin[2], Clock, R2);
 regn reg_3(BusWires, Rin[3], Clock, R3);
 
 trin tri_ext (Data, Extern, BusWires);
 trin tri_1 (R1, Rout[1], BusWires);
 trin tri_2 (R2, Rout[2], BusWires);
 trin tri_3 (R3, Rout[3], BusWires);
 
 
 endmodule