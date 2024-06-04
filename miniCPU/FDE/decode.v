module decode(
    input [15:0] instruction,  // �Է� ��ɾ�
    output [3:0] opcode,       // ��� opcode
    output [3:0] srcadd_1,     // ��� ù ��° �ҽ� �ּ�
    output [3:0] srcadd_2,     // ��� �� ��° �ҽ� �ּ�
    output [3:0] dstadd        // ��� ��� �ּ�
);

    // �� �ʵ带 ��ɾ�� ����
    assign opcode = instruction[15:12];
    assign srcadd_1 = instruction[11:8];
    assign srcadd_2 = instruction[7:4];
    assign dstadd = instruction[3:0];

endmodule
