
module alu4bit (
    input  [3:0] A, B,       // 4-bit inputs
    input  [2:0] ALU_Sel,    // ALU select signal
    output reg [3:0] ALU_Out,// 4-bit output
    output reg CarryOut      // Carry output for arithmetic ops
);

always @(*) begin
    case (ALU_Sel)
        3'b000: {CarryOut, ALU_Out} = A + B;      // Addition
        3'b001: {CarryOut, ALU_Out} = A - B;      // Subtraction
        3'b010: ALU_Out = A & B;                  // AND
        3'b011: ALU_Out = A | B;                  // OR
        3'b100: ALU_Out = A ^ B;                  // XOR
        3'b101: ALU_Out = ~(A);                   // NOT A
        3'b110: ALU_Out = ~(B);                   // NOT B
        3'b111: ALU_Out = 4'b0000;                // Clear
        default: ALU_Out = 4'b0000;
    endcase
end

endmodule

