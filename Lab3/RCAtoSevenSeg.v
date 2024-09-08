`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 13:58:28
// Design Name: 
// Module Name: RCAtoSevenSeg
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


module RCAtoSevenSeg(
    input [3:0] A,
    input [3:0] B,
    output Overflow,
    output [6:0] D
    );
    wire [4:0] Sum;
    FourBitRCA Adder(.A(A), .B(B), .Sum(Sum));
    assign Overflow = Sum[4];
    SevenSegDecoder Decoder(.S(Sum[3:0]), .D(D));
endmodule
