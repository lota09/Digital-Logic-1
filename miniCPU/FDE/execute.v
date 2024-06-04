module execute(
    input clk,               // Ŭ�� �Է�
    input reset,             // ���� ��ȣ �Է�
    input [3:0] opcode,     // ��ɾ� opcode �Է�
    input [3:0] srcadd_1,   // ù ��° �ҽ� ������ �Է�
    input [3:0] srcadd_2,   // �� ��° �ҽ� ������ �Է�
    input [3:0] dstadd,     // ��� �ּ� �Է� //FM decode

    output [7:0] operand_1, // �ʱ�ȭ�� �����մϴ�.
    output [7:0] operand_2, // �ʱ�ȭ�� �����մϴ�.
    output [7:0] result,    // �ʱ�ȭ�� �����մϴ�.
    output write_en         // �ʱ�ȭ�� �����մϴ�.
);

    // �������� ��� �ν��Ͻ� ���� (�б��)
    ReadRegister readsrc_1(
        .address(srcadd_1),
        .data_read(operand_1) // srcadd_1 �ּҿ��� ���� ������
    );
    ReadRegister readsrc_2(
        .address(srcadd_2),
        .data_read(operand_2) // srcadd_2 �ּҿ��� ���� ������
    );

    // ALU ��� �ν��Ͻ� ����
    alu alu_inst (
        .opcode(opcode[2:0]),   // opcode�� ���� 3��Ʈ�� ����
        .operand1(operand_1),
        .operand2(operand_2),
        .result(result)
    );

    // �������� ��� �ν��Ͻ� ���� (�����)
    WriteRegister writedst(
        .address(dstadd),
        .data_write(result),    // ��� ���� ���� �����ͷ� ����
        .write_en(write_en)    // ���� ���� Ȱ��ȭ ��ȣ
    );

endmodule
