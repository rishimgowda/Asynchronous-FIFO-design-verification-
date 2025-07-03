`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 17:27:20
// Design Name: 
// Module Name: dual_port_memory
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


module dual_port_ram #(parameter DEPTH = 16, WIDTH = 8)(
    input [WIDTH-1:0] data_in,
    input [$clog2(DEPTH)-1:0] write_addr, read_addr,
    input write_en, read_en,
    input clk_write, clk_read,
    output reg [WIDTH-1:0] data_out
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    always @(posedge clk_write)
        if (write_en) mem[write_addr] <= data_in;

    always @(posedge clk_read)
        if (read_en) data_out <= mem[read_addr];
endmodule

