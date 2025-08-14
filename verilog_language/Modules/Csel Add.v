module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] lower_sum, upper_sum0, upper_sum1;
    wire cout;

    // Lower 16-bit adder with cin=0
    add16 lower_adder (.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(lower_sum),.cout(cout));

    // Upper 16-bit adder with cin=0
    add16 upper_adder0 (.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(upper_sum0),.cout());

    // Upper 16-bit adder with cin=1
    add16 upper_adder1 (.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(upper_sum1),.cout());

    // Multiplexer to select upper sum based on lower carry-out
    assign sum[15:0] = lower_sum;
    assign sum[31:16] = (cout) ? upper_sum1 : upper_sum0;
endmodule
