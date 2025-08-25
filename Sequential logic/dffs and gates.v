module top_module (
    input clk,
    input x,
    output z
); 
   reg  q0, q1, q2;
    wire d0, d1, d2;
    
    assign d0 = q0^x;
    assign d1 = x & ~q1;
    assign d2 = x | ~q2;
     initial {q0, q1, q2} = 3'b000;
    always @(posedge clk) begin
        q0 <= d0;
        q1 <= d1;
        q2 <= d2;
    end 
    assign z = ~(q0|q1|q2);
endmodule
