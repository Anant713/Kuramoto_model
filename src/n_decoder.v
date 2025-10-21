module decoder (in,out)
    parameter N = 4;  // Number of input bits
    input [N-1:0] in;           // N-bit input
    output reg [(2**N)-1:0] out; // 2^N outputs (one-hot)
    
    always @(*) begin
        out = 0;                // Default all outputs to 0
        out[in] = 1'b1;         // Set the corresponding output to 1
    end
endmodule 