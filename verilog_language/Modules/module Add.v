module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire c_out;

    add16 second_adder (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(c_out)
    );

    add16 first_adder (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(c_out),
        .sum(sum[31:16]),
        .cout() // no carry out used here
    );

endmodule
