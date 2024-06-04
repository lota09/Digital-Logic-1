module subtractor_full(
    input a,
    input b,
    input bi,
    output bo,
    output sub
);

  assign sub = a^b^bi;
  assign bo = (~a&b)+(~a&bi)+(b&bi);

endmodule