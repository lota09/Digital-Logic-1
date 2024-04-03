module counter(clk,rst_n,cnt);
input clk,rst_n;
output [7:0] cnt; //8bit

reg [7:0] cnt;

always @(posedge clk) begin //rst_n 1이면 초기화
if(rst_n)
    cnt=8'h00; //h00으로 초기화
else
    cnt=cnt+1;
end
endmodule

`timescale 1ns/1ps
module counter_tb;
reg clk,rst_n;
wire [7:0] cnt;

counter counter_inst(.clk(clk),.rst_n(rst_n),.cnt(cnt));

initial begin
    clk=0;
    rst_n=0; #2
    
    rst_n=1; #2 //cnt 초기화
    rst_n=0; #200 //cnt 200동안 증가
    
    rst_n=1; #2 //cnt 초기화
    rst_n=0; #10    //cnt 10동안 증가
    
    $finish;
end
always #1 clk = ~clk;

initial begin
    $monitor("시간 = %t, output cnt = %d", $time, cnt);
end
endmodule
