module top_module(clk, reset, in, out);
    input clk;
    input reset;    // synchronous reset to state B
    input in;
    output reg out;

    parameter A = 1'b0, B = 1'b1;
    reg present_state, next_state;
    always @(posedge clk) begin
        if (reset) begin
            present_state <= B; // synchronous reset to state B
        end else begin
            present_state <= next_state; // update to next state
        end
    end

    // Next state logic
    always @(*) begin
        case (present_state)
            A: begin
                if (in == 0)
                    next_state = B;
                else
                    next_state = A;
            end
            B: begin
                if (in == 0)
                    next_state = A;
                else
                    next_state = B;
            end
            default: next_state = B;
        endcase
    end
    always @(*) begin
        case (present_state)
            A: out = 0;
            B: out = 1;
            default: out = 0;
        endcase
    end
endmodule
