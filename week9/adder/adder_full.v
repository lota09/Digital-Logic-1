module adder_full(
    input a,
    input b,
    input ci,
    output co,
    output sum
);

  assign co = (a&b) | (b&ci) | (a&ci);
  assign sum = a ^ b ^ ci;

endmodule
