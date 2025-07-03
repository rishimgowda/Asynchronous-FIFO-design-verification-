`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 18:00:32
// Design Name: 
// Module Name: pointer_logic
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


module pointer_logic #(parameter ADDR_WIDTH = 4)(
    input clk, rst, inc_en,
    output reg [ADDR_WIDTH-1:0] bin_ptr,
    output reg [ADDR_WIDTH-1:0] gray_ptr
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bin_ptr <= 0;
            gray_ptr <= 0;
        end else if (inc_en) begin
            bin_ptr <= bin_ptr + 1;
            gray_ptr <= (bin_ptr >> 1) ^ bin_ptr; // Binary to Gray
        end
    end
endmodule

