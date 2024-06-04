module fetch(
    input clk,        // Ŭ�� �Է�
    input reset,      // ���� ��ȣ �Է�
    input stop,       // ���� ��ȣ �Է�
    output reg [3:0] pc  // ���α׷� ī���� ���
);

    // �׻� ���, Ŭ���� ��� �������� ����
    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            // reset ��ȣ�� Ȱ��ȭ�Ǹ� ���α׷� ī���͸� 0���� �ʱ�ȭ
            pc <= 4'b0;
        end
        else if (~stop) begin
            // stop ��ȣ�� ��Ȱ��ȭ�� ��� ���α׷� ī���� ����
            pc <= pc + 4'b1;
        end
        // stop ��ȣ�� Ȱ��ȭ�� ��� ���α׷� ī���� ����
    end

endmodule
