`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 12:36:32
// Design Name: 
// Module Name: EqualComparator
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


module EqualComparator(
    input [31:0] src1, src2,
    output reg Y
);
    always@(*) begin
        if(src1 == src2)
            Y <= 1;
        else
            Y  <= 0;
    end
endmodule
