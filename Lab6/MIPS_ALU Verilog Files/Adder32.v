`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 12:36:32
// Design Name: 
// Module Name: Adder32
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


module Adder32(
    input [31:0] A, B,
    input Cin,
    output [31:0] Sum,
    output Cout
);
    wire [30:0] carry;
    FullAdder FA0(Sum[0], carry[0], A[0], B[0], Cin);
    genvar i;
    generate
        for (i=1;i<31;i=i+1) begin
            FullAdder FA(Sum[i], carry[i], A[i], B[i], carry[i-1]);
        end
    endgenerate
    FullAdder FAN(Sum[31], Cout, A[31], B[31], carry[30]);
endmodule

module FullAdder(sum, carry, a, b, Cin);
  output sum, carry;
  input a, b, Cin;
  assign sum = a ^ b ^ Cin;
  assign carry = (a & b)|(b & Cin)|(Cin & a);
endmodule