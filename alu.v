`timescale 1ns / 1ps
//==================================================
// Low Power ALU Design Using VLSI
// Operations:
// 00 - ADD
// 01 - SUB
// 10 - AND
// 11 - OR
//==================================================

module ALU (
    input enable,
    input [3:0] A,
    input [3:0] B,
    input [1:0] Sel,
    output reg [3:0] Result
);

always @(*) begin
    if (enable) begin
        case (Sel)
            2'b00: Result = A + B;   // Addition
            2'b01: Result = A - B;   // Subtraction
            2'b10: Result = A & B;   // AND
            2'b11: Result = A | B;   // OR
            default: Result = 4'b0000;
        endcase
    end
    else begin
        Result = 4'b0000;
    end
end

endmodule
