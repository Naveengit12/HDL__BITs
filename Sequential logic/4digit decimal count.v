module top_module (
    input clk,
    input reset,          
    output [3:1] ena,     
    output reg [15:0] q   
);

    assign ena[1] = (q[3:0] == 4'd9);                                 
    assign ena[2] = ena[1] && (q[7:4] == 4'd9);                       
    assign ena[3] = ena[2] && (q[11:8] == 4'd9);                      

    always @(posedge clk) begin
        if (reset) begin
            q <= 16'd0;
        end
        else begin
            if (q[3:0] == 4'd9)
                q[3:0] <= 4'd0;
            else
                q[3:0] <= q[3:0] + 1;
            if (ena[1]) begin
                if (q[7:4] == 4'd9)
                    q[7:4] <= 4'd0;
                else
                    q[7:4] <= q[7:4] + 1;
            end
            if (ena[2]) begin
                if (q[11:8] == 4'd9)
                    q[11:8] <= 4'd0;
                else
                    q[11:8] <= q[11:8] + 1;
            end
            if (ena[3]) begin
                if (q[15:12] == 4'd9)
                    q[15:12] <= 4'd0;
                else
                    q[15:12] <= q[15:12] + 1;
            end
        end
    end

endmodule
