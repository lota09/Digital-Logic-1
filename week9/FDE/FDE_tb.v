`timescale 1ns/1ps

module FDE_tb();

    // 입력 신호
    reg clk;
    reg reset;
    reg stop;

    // 출력 신호
    wire [3:0] opcode;
    wire [7:0] operand_1;
    wire [7:0] operand_2;
    wire [7:0] result;
    wire [3:0] pc;

    // 테스트할 CPU 모듈
    Top Top_inst(
        //input
        .clk(clk),         // 클럭 입력
        .reset(reset),     // 리셋 신호 입력
        .stop(stop),       // 중지 신호 입력

        //output
        .opcode(opcode),
        .operand_1(operand_1),
        .operand_2(operand_2),
        .result(result),
        .pc(pc)
    );

    // 초기화 및 동작 시나리오
    initial begin
        // 초기값 설정
        clk = 0; reset = 1; stop = 1;
        
        #10
        reset = 0;        // 리셋 비활성화

        #10
        reset = 1;        // 리셋 활성화

        #100
        stop = 0;         // 멈춤 비활성화

        #1000
        $finish;          // 테스트 종료
    end

    // 클럭 생성
    always begin
        #50
        clk = ~clk;      // 클럭 반전
    end

endmodule
