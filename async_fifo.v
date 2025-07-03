`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 18:03:22
// Design Name: 
// Module Name: async_fifo
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


module async_fifo #(parameter DEPTH = 16, WIDTH = 8)(
    input [WIDTH-1:0] data_in,
    input wr_clk, rd_clk,
    input wr_en, rd_en,
    output [WIDTH-1:0] data_out,
    output full, empty
);
    wire [$clog2(DEPTH):0] wr_ptr_bin, rd_ptr_bin;
    wire [$clog2(DEPTH):0] wr_ptr_gray, rd_ptr_gray;

    pointer_logic #(4) wr_ptr (.clk(wr_clk), .rst(0), .inc_en(wr_en), .bin_ptr(wr_ptr_bin), .gray_ptr(wr_ptr_gray));
    pointer_logic #(4) rd_ptr (.clk(rd_clk), .rst(0), .inc_en(rd_en), .bin_ptr(rd_ptr_bin), .gray_ptr(rd_ptr_gray));

    full_empty_flag #(4) status (.wr_ptr(wr_ptr_gray), .rd_ptr(rd_ptr_gray), .full(full), .empty(empty));

    dual_port_ram #(DEPTH, WIDTH) mem (.data_in(data_in), .write_addr(wr_ptr_bin[$clog2(DEPTH)-1:0]),
                                       .read_addr(rd_ptr_bin[$clog2(DEPTH)-1:0]), .write_en(wr_en),
                                       .read_en(rd_en), .clk_write(wr_clk), .clk_read(rd_clk), .data_out(data_out));
endmodule

