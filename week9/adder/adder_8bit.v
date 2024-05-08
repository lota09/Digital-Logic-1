module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input ci,
    output [7:0] sum,
    output co
);

wire [7:0] c;

adder_full adder0(.a(a[0]), .b(b[0]), .ci(ci), .sum(sum[0]), .co(c[0]));
adder_full adder1(.a(a[1]), .b(b[1]), .ci(c[0]), .sum(sum[1]), .co(c[1]));
adder_full adder2(.a(a[2]), .b(b[2]), .ci(c[1]), .sum(sum[2]), .co(c[2]));
adder_full adder3(.a(a[3]), .b(b[3]), .ci(c[2]), .sum(sum[3]), .co(c[3]));
adder_full adder4(.a(a[4]), .b(b[4]), .ci(c[3]), .sum(sum[4]), .co(c[4]));
adder_full adder5(.a(a[5]), .b(b[5]), .ci(c[4]), .sum(sum[5]), .co(c[5]));
adder_full adder6(.a(a[6]), .b(b[6]), .ci(c[5]), .sum(sum[6]), .co(c[6]));
adder_full adder7(.a(a[7]), .b(b[7]), .ci(c[6]), .sum(sum[7]), .co(c[7]));

assign co = c[7];

endmodule
