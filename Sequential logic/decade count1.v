module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset)
            q <= 4'b1;
             else if (q == 4'd10)
            q <= 4'd1;            // Wrap back to 1 after 10
        else
            q <= q + 1'b1;        // Increment
    end
endmodule
