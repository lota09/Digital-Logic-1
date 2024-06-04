module subtractor_8bit(
    input [7:0] a,
    input [7:0] b,
    input bi,
    output [7:0] sub,
    output bo
);

wire [7:0] c;

subtractor_full subtractor0(.a(a[0]), .b(b[0]), .bi(bi), .sub(sub[0]), .bo(c[0]));
subtractor_full subtractor1(.a(a[1]), .b(b[1]), .bi(c[0]), .sub(sub[1]), .bo(c[1]));
subtractor_full subtractor2(.a(a[2]), .b(b[2]), .bi(c[1]), .sub(sub[2]), .bo(c[2]));
subtractor_full subtractor3(.a(a[3]), .b(b[3]), .bi(c[2]), .sub(sub[3]), .bo(c[3]));
subtractor_full subtractor4(.a(a[4]), .b(b[4]), .bi(c[3]), .sub(sub[4]), .bo(c[4]));
subtractor_full subtractor5(.a(a[5]), .b(b[5]), .bi(c[4]), .sub(sub[5]), .bo(c[5]));
subtractor_full subtractor6(.a(a[6]), .b(b[6]), .bi(c[5]), .sub(sub[6]), .bo(c[6]));
subtractor_full subtractor7(.a(a[7]), .b(b[7]), .bi(c[6]), .sub(sub[7]), .bo(c[7]));

assign bo = c[7];

endmodule
