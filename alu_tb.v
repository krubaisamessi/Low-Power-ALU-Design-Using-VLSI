`timescale 1ns / 1ps

module ALU_tb;

reg enable;
reg [3:0] A;
reg [3:0] B;
reg [1:0] Sel;

wire [3:0] Result;

// Instantiate the ALU
ALU uut (
    .enable(enable),
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result)
);

initial begin

    $display("Time\tEnable\tA\tB\tSel\tResult");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
              $time, enable, A, B, Sel, Result);

    // Test Inputs
    enable = 1;
    A = 4'b0101;   // 5
    B = 4'b0011;   // 3

    // ADD
    Sel = 2'b00;
    #10;

    // SUB
    Sel = 2'b01;
    #10;

    // AND
    Sel = 2'b10;
    #10;

    // OR
    Sel = 2'b11;
    #10;

    // Disable ALU (Low Power Mode)
    enable = 0;
    #10;

    $finish;

end

endmodule
