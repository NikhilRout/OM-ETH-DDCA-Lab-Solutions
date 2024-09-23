`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 12:36:32
// Design Name: 
// Module Name: Multiplexer2_1
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


module Multiplexer2_1(
    input [31:0] D1, D0,
    input sel,
    output [31:0] Y
);
    assign Y = sel ? D1 : D0;
endmodule
