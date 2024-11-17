`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 12:36:32
// Design Name: 
// Module Name: MIPS_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MIPS_ALU(
    input [31:0] A, B,
    input [3:0] AluOp,
    output [31:0] Result,
    output C, Z
);
    //Arithmetic Block
    wire [31:0] notB, inpB, AddOut, SLText, ArithOut;
    BitwiseNOT BN0(.A(B), .Y(notB));
    Multiplexer2_1 MUX0(.D1(notB), .D0(B), .sel(AluOp[1]), .Y(inpB));
    Adder32 RCA0(.A(A), .B(inpB), .Cin(AluOp[1]), .Sum(AddOut), .Cout(C));
    Extend E0(.thebit(AddOut[31]), .extended(SLText));
    Multiplexer2_1 MUX1(.D1(SLText), .D0(AddOut), .sel(AluOp[3]), .Y(ArithOut));
    
    //Logic Block
    wire [31:0] bwAND, bwOR, bwXOR, bwNOR, LogicOut;
    BitwiseAND Band(.A(A), .B(B), .Y(bwAND));
    BitwiseOR Bor(.A(A), .B(B), .Y(bwOR));
    BitwiseXOR Bxor(.A(A), .B(B), .Y(bwXOR));
    BitwiseNOR Bnor(.A(A), .B(B), .Y(bwNOR));
    Multiplexer4_1 MUX2(.D0(bwAND), .D1(bwOR), .D2(bwXOR), .D3(bwNOR), .sel(AluOp[1:0]), .Y(LogicOut));
    
    //top
    wire [31:0] res;
    Multiplexer2_1 MUX3(.D1(LogicOut), .D0(ArithOut), .sel(AluOp[2]), .Y(res));
    EqualComparator EC0(.src1(res), .src2(32'b0), .Y(Z));
    assign Result = res;       
endmodule
