`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 13:37:51
// Design Name: 
// Module Name: SevenSegment
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


module SevenSegDecoder(
    input [3:0] S,
    output reg [6:0] D
    );
    always @(*) begin
        case (S)
            4'b0000: D <= 7'h01;
            4'b0001: D <= 7'h4F;
            4'b0010: D <= 7'h12;
            4'b0011: D <= 7'h06;
            4'b0100: D <= 7'h4C;
            4'b0101: D <= 7'h24;
            4'b0110: D <= 7'h20;
            4'b0111: D <= 7'h0F;
            4'b1000: D <= 7'h00;
            4'b1001: D <= 7'h04;
            4'b1010: D <= 7'h08;
            4'b1011: D <= 7'h60;
            4'b1100: D <= 7'h31;
            4'b1101: D <= 7'h42;
            4'b1110: D <= 7'h30;
            4'b1111: D <= 7'h38;
        endcase
    end
endmodule
