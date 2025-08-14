module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule


module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_low, sum_high;
    wire carry_out;

    // Lower 16 bits
    add16 Lower(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum_low),.cout(carry_out));

    // Upper 16 bits
    add16 Upper(.a(a[31:16]),.b(b[31:16]),.cin(carry_out),.sum(sum_high),.cout());
    assign sum = {sum_high, sum_low};
endmodule
