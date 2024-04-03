module Parity(
  input a,b,c,
  output y
);
  assign y= ~(c||(a&b));
endmodule

`timescale 1ns/1ps
module parity_tb;
reg a,b,c;
wire y;
parity instance_parity(
  .a(a),
  .b(b),
  .y(y)
);

inital begin
a=0; b=0; c=0;
#10; a=0; b=0; c=1;
#10; a=0; b=1; c=0;
#10; a=0; b=1; c=1;
#10; a=1; b=0; c=0;
#10; a=1; b=0; c=1;
#10; a=1; b=1; c=0;
#10; a=1; b=1; c=1;
#10;
$finish;
end
initial begin
  $monitor("시간=%t, a=%b, b=%b, c=%b, y=%b", $time, a, b, c, y);
end
endmodule
