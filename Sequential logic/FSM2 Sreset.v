module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out);  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin
        case(state)
            A : next_state = j ? B : A;
            B : next_state = k ? A : B;
        endcase
    end
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    assign out = (state == B);
endmodule
