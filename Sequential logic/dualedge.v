module top_module (
    input clk,
    input d,
    output q
);
    reg q_pos, q_neg;
   always @(posedge clk)
        q_pos <= d;
    always @(negedge clk)
        q_neg <= d;
    always @(*) begin
        if (clk)
            q = q_pos;
        else
            q = q_neg;
    end
endmodule
