module execute(
    input clk,               // 클럭 입력
    input reset,             // 리셋 신호 입력
    input [3:0] opcode,     // 명령어 opcode 입력
    input [3:0] srcadd_1,   // 첫 번째 소스 데이터 입력
    input [3:0] srcadd_2,   // 두 번째 소스 데이터 입력
    input [3:0] dstadd,     // 대상 주소 입력 //FM decode

    output reg [7:0] operand_1 = 8'b0, // 초기값 설정
    output reg [7:0] operand_2 = 8'b0, // 초기값 설정
    output reg [7:0] result = 8'b0,    // 초기값 설정
    output reg write_en = 1'b0        // 초기값 설정
);

    // 레지스터 모듈 인스턴스 생성 (읽기용)
    ReadRegister readsrc_1(
        .address(srcadd_1),
        .data_read(operand_1) // srcadd_1 주소에서 읽은 데이터
    );
    ReadRegister readsrc_2(
        .address(srcadd_2),
        .data_read(operand_2) // srcadd_2 주소에서 읽은 데이터
    );

    // ALU 모듈 인스턴스 생성
    alu alu_inst (
        .opcode(opcode[2:0]),   // opcode의 하위 3비트를 전달
        .operand1(operand_1),
        .operand2(operand_2),
        .result(result)
    );

    // 레지스터 모듈 인스턴스 생성 (쓰기용)
    WriteRegister writedst(
        .address(dstadd),
        .data_write(result),    // 결과 값을 쓰기 데이터로 설정
        .write_en(write_en)    // 쓰기 동작 활성화 신호
    );

endmodule
