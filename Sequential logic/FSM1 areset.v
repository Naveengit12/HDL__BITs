module top_module (
	input clk,
	input in,
	input areset,
	output out
);
	parameter A=0, B=1;
	reg state;		// Ensure state and next are big enough to hold the state encoding.
	reg next;
    always@(*) begin
		case (state)
			A: next = in ? A : B;
			B: next = in ? B : A;
		endcase
    end
    always @(posedge clk, posedge areset) begin
		if (areset) state <= B;		// Reset to state B
        else state <= next;			// Otherwise, cause the state to transition
	end
	assign out = (state==B);
endmodule
