module Top(
    input   clk,              // Ŭ�� �Է�
    input   reset,            // ���� ��ȣ �Է�
    input   stop,             // ���� ��ȣ �Է�

    output [3:0] opcode,
    output [7:0] operand_1,
    output [7:0] operand_2,
    output [7:0] result,
    output [3:0] pc
);

wire [15:0] instruction;
wire [3:0] srcadd_1, srcadd_2, dstadd;
wire write_en;

fetch fetch_inst(
    .clk(clk),             // Ŭ�� �Է�
    .reset(reset),           // ���� ��ȣ �Է�
    .stop(stop),       // ���� ��ȣ �Է�
    .pc(pc)  // ���α׷� ī���� ���
);

InstMem InstMem_inst(
    //input
    .clk(clk),                // Ŭ�� �Է�
    .reset(reset),              // ���� ��ȣ �Է�
    .stop(stop),               // ���� ��ȣ �Է�
    .pc(pc),           // ���α׷� ī���� �Է� (4��Ʈ)

    //output
    .instruction(instruction) // ��ɾ� ���
);

decode decode_inst(
    //input
    .instruction(instruction),  // �Է� ��ɾ�

    //output
    .opcode(opcode),       // ��� opcode
    .srcadd_1(srcadd_1),     // ��� ù ��° �ҽ� �ּ�
    .srcadd_2(srcadd_2),     // ��� �� ��° �ҽ� �ּ�
    .dstadd(dstadd)        // ��� ��� �ּ�
);

execute execute_inst(
    //input
    .clk(clk),             // Ŭ�� �Է�
    .reset(reset),           // ���� ��ȣ �Է�
    .opcode(opcode),    // ��ɾ� opcode �Է�
    .srcadd_1(srcadd_1),  // ù ��° �ҽ� ������ �Է�
    .srcadd_2(srcadd_2),  // �� ��° �ҽ� ������ �Է�
    .dstadd(dstadd),     // ��� �ּ� �Է� //FM decode

    //output
    .operand_1(operand_1),
    .operand_2(operand_2),
    .result(result),
    .write_en(write_en)
);

endmodule
