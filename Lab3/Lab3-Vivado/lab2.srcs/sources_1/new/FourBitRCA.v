`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 23:47:17
// Design Name: 
// Module Name: FourBitRCA
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


module FourBitRCA(
    input [3:0] A, B,
    output [4:0] Sum
);
    wire w0, w1, w2;
    FullAdder FA0(.a(A[0]), .b(B[0]), .cin(1'b0), .sum(Sum[0]), .cout(w0));
    FullAdder FA1(.a(A[1]), .b(B[1]), .cin(w0), .sum(Sum[1]), .cout(w1));
    FullAdder FA2(.a(A[2]), .b(B[2]), .cin(w1), .sum(Sum[2]), .cout(w2));
    FullAdder FA3(.a(A[3]), .b(B[3]), .cin(w2), .sum(Sum[3]), .cout(Sum[4]));
endmodule
