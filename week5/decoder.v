module decoder(
    input i0, i1,
    output d0, d1, d2, d3
);
    assign d0= ~i1&~i0; // 0 0
    assign d1= ~i1&i0; // 0 1
    assign d2= i1&~i0; // 1 0
    assign d3= i1&i0; // 1 1
  
endmodule

`timescale 1ns/ 1ps

module decoder_tb;
reg i0,i1;
wire d0,d1,d2,d3;

decoder instance_decoder(
  .i0(i0),
  .i1(i1),
  
  .d0(d0),
  .d1(d1),
  .d2(d2),
  .d3(d3),  
);

initial begin
    i1=0; i0=0; #10; //0 0
    i1=0; i0=1; #10; //0 1
    i1=1; i0=0; #10; //1 0
    i1=1; i0=1; #10; //1 1
    $finish;
end

initial begin
  $monitor("시간=%t, i1=%b, i0=%b, d=%b%b%b%b", $time, i1, i0, d0, d1, d2, d3);
end

endmodule
