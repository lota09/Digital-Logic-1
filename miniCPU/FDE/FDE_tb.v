`timescale 1ns/1ps

module FDE_tb();

    // �Է� ��ȣ
    reg clk;
    reg reset;
    reg stop;

    // ��� ��ȣ
    wire [3:0] opcode;
    wire [7:0] operand_1;
    wire [7:0] operand_2;
    wire [7:0] result;
    wire [3:0] pc;

    // �׽�Ʈ�� CPU ���
    Top Top_inst(
        //input
        .clk(clk),         // Ŭ�� �Է�
        .reset(reset),     // ���� ��ȣ �Է�
        .stop(stop),       // ���� ��ȣ �Է�

        //output
        .opcode(opcode),
        .operand_1(operand_1),
        .operand_2(operand_2),
        .result(result),
        .pc(pc)
    );

    // �ʱ�ȭ �� ���� �ó�����
    initial begin
        // �ʱⰪ ����
        clk = 0; reset = 1; stop = 1;
        
        #10
        reset = 0;        // ���� ��Ȱ��ȭ

        #10
        reset = 1;        // ���� Ȱ��ȭ

        #100
        stop = 0;         // ���� ��Ȱ��ȭ
        
        #500
        reset =0;
        
        #10
        reset = 1;
        
        #100
        stop=1;
        #50
        stop=0;

        #2000
        $finish;          // �׽�Ʈ ����
    end

    // Ŭ�� ����
    always begin
        #50
        clk = ~clk;      // Ŭ�� ����
    end

endmodule
