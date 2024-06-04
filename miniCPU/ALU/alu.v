module alu (
  input  [2:0] opcode,
  input  [7:0] operand1,
  input  [7:0] operand2,
  output reg [7:0] result
);

  wire [7:0] sum;
  wire [7:0] sub;
  wire co, bo;

  // Adder and Subtractor instances
  adder_8bit adder (
    .a(operand1),
    .b(operand2),
    .ci(1'b0),
    .sum(sum),
    .co(co)
  );

  subtractor_8bit subtractor (
    .a(operand1),
    .b(operand2),
    .bi(1'b0),
    .sub(sub),
    .bo(bo)
  );
  
  // ALU operation selection and execution
  always @(*) begin
    case (opcode)
      3'b000: result = sum;                     // add
      3'b001: result = sub;                     // sub
      3'b010: result = ~operand1;               // not
      3'b011: result = operand1 & operand2;     // and
      3'b100: result = operand1 | operand2;     // or
      3'b101: result = operand1 ^ operand2;     // xor
      3'b110: result = operand1 << 1;           // shift left
      3'b111: result = operand1 >> 1;           // shift right
      default: result = 8'b00000000;
    endcase
  end

endmodule
