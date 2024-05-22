module Register(
    input [3:0] address,
    input [7:0] data_write,
    input write_en,
    output reg [7:0] data_read
);
    reg [7:0] regi[15:0];  // 값 메모리 1byte * 16

    // 메모리 초기화 블록

initial begin
    regi[1]  = 8'd0;
    regi[2]  = 8'd64;
    regi[3]  = 8'd96;
    regi[4]  = 8'd128;
    regi[5]  = 8'd160;
    regi[6]  = 8'd192;
    regi[7]  = 8'd224;
    regi[8]  = 8'd32;
    regi[9]  = 8'd64;
    regi[10] = 8'd96;
    regi[11] = 8'd128;
    regi[12] = 8'd160;
    regi[13] = 8'd192;
    regi[14] = 8'd224;
    regi[15] = 8'd32;
end

    // 읽기 동작 수행
    always @(address) begin
        data_read = regi[address];
    end

    // 쓰기 동작 수행
    always @(posedge write_en) begin
        if (write_en) begin
            regi[address] = data_write;
        end
    end
endmodule

module ReadRegister(
    input [3:0] address,
    output [7:0] data_read
);
Register regi_inst (
    .address(address),
    .data_write(8'b0),   // 쓰기 동작에 사용되지 않으므로 0으로 초기화
    .write_en(1'b0),     // 쓰기 동작 비활성화
    .data_read(data_read)
);
endmodule

module WriteRegister(
    input [3:0] address,
    input [7:0] data_write,
    output reg write_en
);
Register regi_inst (
    .address(address),
    .data_write(data_write),
    .write_en(write_en),
    .data_read()
);
endmodule
