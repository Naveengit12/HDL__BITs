module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);
    wire [3:0] q0, q1, q2;

    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (q0 == 4'd9);
    assign c_enable[2] = (q0 == 4'd9) && (q1 == 4'd9);
    assign OneHertz = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);
    wire counter_reset = reset | OneHertz;

    // Instantiate 3 BCD counters
    bcdcount c0 (clk, counter_reset, c_enable[0], q0);
    bcdcount c1 (clk, counter_reset, c_enable[1], q1);
    bcdcount c2 (clk, counter_reset, c_enable[2], q2);

endmodule
