module D_ff(D, Q, Q_bar, clk, reset);
    input D, clk, reset;
    output Q, Q_bar;
    reg Q, Q_bar;

    always @(posedge clk or posedge reset) begin // asynchronous reset 
        if (reset) begin
            Q <= 0;
            Q_bar <= 1;
        end else begin
            Q <= D;
            Q_bar <= ~D;
        end
    end
endmodule
