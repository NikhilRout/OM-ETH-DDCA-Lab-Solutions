`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 18:01:31
// Design Name: 
// Module Name: Multiplexer4_1
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


module Multiplexer4_1(
    input [31:0] D0, D1, D2, D3,
    input [1:0] sel,
    output reg [31:0] Y
);
    always @(*) begin
        case(sel)
            2'b00: Y <= D0;
            2'b01: Y <= D1;
            2'b10: Y <= D2;
            2'b11: Y <= D3;
        endcase
    end
endmodule
