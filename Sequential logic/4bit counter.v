module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset)
            q <= 4'd0;         // Reset counter to 0
        else
            q <= q + 1'b1;     // Increment counter
    end
endmodule
