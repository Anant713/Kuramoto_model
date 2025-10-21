`timescale 1ns/1ps
module tb_D_ff;
    reg D;
    reg clk;
    reg reset;
    wire Q;
    wire Q_bar;

    D_ff uut (.D(D), .clk(clk), .reset(reset), .Q(Q), .Q_bar(Q_bar));

    // Clock generator
    initial clk = 0;
    always #5 clk = ~clk;

    reg [4:0] D_seq = 5'b10110;
    integer i;
    reg success;

    initial begin
        success = 1;
        D = 0;
        reset = 1;   // assert reset
        #7;          // allow reset to propagate and deassert NOT exactly on clock edge
        reset = 0;

        $display("Time\tclk\tD\tQ\tQ_bar");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, D, Q, Q_bar);

        // Prime the DFF after reset: Q should be 0, Q_bar should be 1

        for (i = 0; i < 5; i = i + 1) begin
            D = D_seq[i];
            @(posedge clk); // synchronize: outputs update on posedge clk
            // Only check after knowing outputs are valid
            if (i > 0) begin
                if (Q !== D_seq[i-1]) begin
                    $display("Mismatch at step %0d: Q=%b expected %b", i, Q, D_seq[i-1]);
                    success = 0;
                end
                if (Q_bar !== ~D_seq[i-1]) begin
                    $display("Mismatch at step %0d: Q_bar=%b expected %b", i, Q_bar, ~D_seq[i-1]);
                    success = 0;
                end
            end
        end

        if (success)
            $display("TEST PASSED: All outputs matched expected values!");
        else
            $display("TEST FAILED: See mismatches above.");

        #10 $finish;
    end
endmodule
