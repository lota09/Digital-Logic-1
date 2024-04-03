module Parity(
  input a,b,c,
  output y
);
  assign y= ~(c||(a&b));
endmodule
