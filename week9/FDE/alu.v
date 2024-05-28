module alu (
  input  [2:0] opcode,
  input  [7:0] operand1,
  input  [7:0] operand2,
  output reg [7:0] result
);

  // ALU operation selection and execution
  always @(*) begin
    case (opcode)
      3'b000: result = operand1 + operand2;    // add
      3'b001: result = operand1 - operand2;    // sub
      3'b010: result = ~operand1;              // not
      3'b011: result = operand1 & operand2;    // and
      3'b100: result = operand1 | operand2;    // or
      3'b101: result = operand1 ^ operand2;    // xor
      3'b110: result = operand1 << 1;         // shift left
      3'b111: result = operand1 >> 1;         // shift right
      default: result = 8'b00000000;
    endcase
  end

endmodule
