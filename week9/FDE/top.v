module Top(
    input   clk,              // 클럭 입력
    input   reset,            // 리셋 신호 입력
    input   stop,             // 중지 신호 입력

    output [3:0] opcode,
    output [7:0] operand_1,
    output [7:0] operand_2,
    output [7:0] result,
    output [3:0] pc
);

wire [15:0] instruction;
wire [3:0] srcadd_1, srcadd_2, dstadd
wire write_en;

fetch fetch_inst(
    .clk(clk),             // 클럭 입력
    .reset(reset),           // 리셋 신호 입력
    .stop(stop),       // 멈춤 신호 입력
    .pc(pc)  // 프로그램 카운터 출력
);

InstMem InstMem_inst(
    //input
    .clk(clk),                // 클럭 입력
    .reset(reset),              // 리셋 신호 입력
    .stop(stop),               // 중지 신호 입력
    .pc(pc),           // 프로그램 카운터 입력 (4비트)

    //output
    .instruction(instruction) // 명령어 출력
);

decode decode_inst(
    //input
    .instruction(instruction),  // 입력 명령어

    //output
    .opcode(opcode),       // 출력 opcode
    .srcadd_1(srcadd_1),     // 출력 첫 번째 소스 주소
    .srcadd_2(srcadd_2),     // 출력 두 번째 소스 주소
    .dstadd(dstadd)        // 출력 대상 주소
);

execute execute_inst(
    //input
    .clk(clk),             // 클럭 입력
    .reset(reset),           // 리셋 신호 입력
    .opcode(opcode),    // 명령어 opcode 입력
    .srcadd_1(srcadd_1),  // 첫 번째 소스 데이터 입력
    .srcadd_2(srcadd_2),  // 두 번째 소스 데이터 입력
    .dstadd(dstadd),     // 대상 주소 입력 //FM decode

    //output
    .operand_1(operand_1),
    .operand_2(operand_2),
    .result(result),
    .write_en(write_en)
);

endmodule
