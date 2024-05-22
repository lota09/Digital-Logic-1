module InstMem(
    input clk,                // 클럭 입력
    input reset,              // 리셋 신호 입력
    input stop,               // 중지 신호 입력
    input [3:0] pc,           // 프로그램 카운터 입력 (4비트)
    output [15:0] instruction // 명령어 출력
);

    reg [15:0] mem[15:0];     // 명령어 메모리 16bit * 16 = 32byte

    always @(posedge clk or negedge reset) begin
        if (~reset)              // 리셋 시
            instruction <= 16'h0; // 현재 명령어 레지스터를 0으로 설정
        else if (~stop)          // 중지 신호가 아닌 경우
            instruction <= mem[pc]; // 현재 프로그램 카운터 위치의 명령어를 가져옴
    end
    
    // 초기 명령어 설정
    initial begin
        // Instruction 예제 16개 초기화
        mem[0]  = 16'b0000_0000_0000_0000; // No operation
        mem[1]  = 16'b0001_0010_0100_0001; // ADD reg[2] + reg[1] to reg[1]
        mem[2]  = 16'b0010_0100_0010_0010; // SUB reg[4] - reg[2] to reg[2]
        mem[3]  = 16'b0011_0011_0001_0100; // NOT reg[3] to reg[4]
        mem[4]  = 16'b0100_0110_0111_0001; // AND reg[6] & reg[7] to reg[1]
        mem[5]  = 16'b0101_0101_0011_0110; // OR reg[5] | reg[3] to reg[6]
        mem[6]  = 16'b0110_0011_0100_0111; // XOR reg[3] ^ reg[4] to reg[7]
        mem[7]  = 16'b0111_0100_0100_0001; // Shift left reg[4] << 1 to reg[1]
        mem[8]  = 16'b1000_0111_0010_0001; // Shift right reg[7] >> 2 to reg[1]
        mem[9]  = 16'b1001_0011_0010_0111; // ADD reg[3] + reg[3] to reg[7]
        mem[10] = 16'b1010_0110_1010_0101; // SUB reg[6] - reg[5] to reg[5]
        mem[11] = 16'b1011_0101_0110_1100; // NOT reg[5] to reg[12]
        mem[12] = 16'b1100_0010_1011_0010; // AND reg[2] & reg[11] to reg[2]
        mem[13] = 16'b1101_0001_0010_1101; // OR reg[1] | reg[2] to reg[13]
        mem[14] = 16'b1110_0011_0117_0001; // XOR reg[3] ^ reg[7] to reg[1]
        mem[15] = 16'b1111_0111_0105_0011; // Shift left reg[7] << 5 to reg[3]
    end

endmodule
