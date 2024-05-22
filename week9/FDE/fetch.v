module fetch(
    input clk,        // 클럭 입력
    input reset,      // 리셋 신호 입력
    input stop,       // 멈춤 신호 입력
    output reg [3:0] pc  // 프로그램 카운터 출력
);

    // 항상 블록, 클럭의 상승 에지에서 동작
    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            // reset 신호가 활성화되면 프로그램 카운터를 0으로 초기화
            pc <= 4'b0;
        end
        else if (~stop) begin
            // stop 신호가 비활성화된 경우 프로그램 카운터 증가
            pc <= pc + 4'b1;
        end
        // stop 신호가 활성화된 경우 프로그램 카운터 유지
    end

endmodule
