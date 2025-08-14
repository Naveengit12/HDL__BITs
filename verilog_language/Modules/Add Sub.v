module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_xor;
    wire [15:0] sum_low, sum_high;
    wire carry;

    // Invert b if sub = 1 (subtraction), else pass b as-is (addition)
    assign b_xor = b ^ {32{sub}};  // XOR with sub replicated 32 times

    // Lower 16-bit adder
    add16 add_lower (.a(a[15:0]),.b(b_xor[15:0]),
         .cin(sub),          // cin = sub → add 1 during subtraction
        .sum(sum_low),
        .cout(carry)
    );

    // Upper 16-bit adder
    add16 add_upper (.a(a[31:16]),.b(b_xor[31:16]),.cin(carry),.sum(sum_high),.cout());
    assign sum = {sum_high, sum_low};
endmodule
