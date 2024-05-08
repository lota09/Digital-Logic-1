`timescale 1ns/1ps
module adder_tb();

reg [7:0] a, b;
reg ci;
wire [7:0] sum;
wire co;

adder_8bit adder(
    .a(a),
    .b(b),
    .ci(ci),
    .sum(sum),
    .co(co)
);

initial begin
        a = 8'd70; b = 8'd50; ci = 0; #10; // 70 + 50,
        a = 8'd12; b = 8'd0; ci = 1; #10;  // 12 + 0 (+1),
        a = 8'd120; b = 8'd220; ci = 0; #10;  // 120 + 89, 오버플로우
        $finish;

end

endmodule
