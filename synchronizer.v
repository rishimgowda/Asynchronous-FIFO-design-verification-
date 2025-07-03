`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 17:37:34
// Design Name: 
// Module Name: synchronizer
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


// synchronizer.v (2 flip-flop)
module synchronizer (
    input clk,
    input async_in,
    output reg sync_out
);
    reg sync_ff1;

    always @(posedge clk) begin
        sync_ff1 <= async_in;
        sync_out <= sync_ff1;
    end
endmodule

