module top_module(
    input clk,
    input reset,       // Active-high synchronous reset to 5'h1
    output reg [4:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 5'h01;  // Initial state: 00001
        else begin
            q <= {q[0],q[4],q[3] ^ q[0],q[2],q[1]};
        end
    end
endmodule
