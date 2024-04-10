module mux(
    input i0, i1, s,
    output d
);
  assign d= (i0&~s)||(i1&s);
endmodule

`timescale 1ns/ 1ps

module mux_tb;
reg i0,i1,s;
wire d;

mux instance_mux(
  .i0(i0),
  .i1(i1),
  .s(s),
  .d(d)
);

initial begin
    i0=0; i1=0; s=0; #10;
    i0=0; i1=0; s=1; #10;
    i0=0; i1=1; s=0; #10;
    i0=0; i1=1; s=1; #10;
    i0=1; i1=0; s=0; #10;
    i0=1; i1=0; s=1; #10;
    i0=1; i1=1; s=0; #10;
    i0=1; i1=1; s=1; #10;
    $finish;
end

initial begin
  $monitor("시간=%t, i0=%b, i1=%b, s=%b, d=%b", $time, i0, i1, s, d);
end

endmodule
