module decode(
    input [15:0] instruction,  // 입력 명령어
    output [3:0] opcode,       // 출력 opcode
    output [3:0] srcadd_1,     // 출력 첫 번째 소스 주소
    output [3:0] srcadd_2,     // 출력 두 번째 소스 주소
    output [3:0] dstadd        // 출력 대상 주소
);

    // 각 필드를 명령어에서 추출
    assign opcode = instruction[15:12];
    assign srcadd_1 = instruction[11:8];
    assign srcadd_2 = instruction[7:4];
    assign dstadd = instruction[3:0];

endmodule
