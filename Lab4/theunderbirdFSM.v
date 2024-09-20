`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2024 23:08:06
// Design Name: 
// Module Name: theunderbirdFSM
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


module theunderbirdFSM(
    input clk, rst, left, right,
    output reg lc, lb, la, ra, rb, rc
    );
    parameter IDLE = 3'b000,
              L1 = 3'b001,
              L2 = 3'b010,
              L3 = 3'b011,
              R1 = 3'b100,
              R2 = 3'b101,
              R3 = 3'b110,
              HAZ = 3'b111;
    reg [2:0] state;
    reg [2:0] next_state; 
    wire clk_en;
    
    //clock division
    clk_div cd(.clk(clk), .rst(rst), .clk_en(clk_en));
    
    //next state combinational logic
    always @(state or left or right) begin
        next_state = 3'b000;
        case(state)
            IDLE:
                if(left == 1'b1)
                    next_state = L1;
                else if(right == 1'b1)
                    next_state = R1;
                else if(left == 1'b1 && right == 1'b1)
                    next_state = HAZ;
                else
                    next_state = IDLE;
            L1:
                if(left == 1'b1)
                    next_state = L2;
                else
                    next_state = IDLE;
            L2:
                if(left == 1'b1)
                    next_state = L3;
                else
                    next_state = IDLE;
            L3:
                next_state = IDLE;
            R1:
                if(right == 1'b1)
                    next_state = R2;
                else
                    next_state = IDLE;
            R2:
                if(right == 1'b1)
                    next_state = R3;
                else
                    next_state = IDLE;
            R3:
                next_state = IDLE;
            HAZ:
                next_state = IDLE;
            default:
                next_state = IDLE;
        endcase            
    end
    
    //sequential logic
    always @(posedge clk_en) begin
        if(rst == 1'b1)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    //output logic
    always @(posedge clk_en) begin
        case(state)
            IDLE:
                {lc, lb, la, ra, rb, rc} <= 6'b000000;
            L1:
                {lc, lb, la, ra, rb, rc} <= 6'b001000;
            L2:
                {lc, lb, la, ra, rb, rc} <= 6'b011000;
            L3:
                {lc, lb, la, ra, rb, rc} <= 6'b111000;
            R1:
                {lc, lb, la, ra, rb, rc} <= 6'b000100;
            R2:
                {lc, lb, la, ra, rb, rc} <= 6'b000110;
            R3:
                {lc, lb, la, ra, rb, rc} <= 6'b000111;
            HAZ:
                {lc, lb, la, ra, rb, rc} <= 6'b111111;
            default:
                {lc, lb, la, ra, rb, rc} <= 6'b000000;
        endcase
    end
endmodule
