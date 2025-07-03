`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 18:03:22
// Design Name: 
// Module Name: tb_async_fifo
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


module tb_async_fifo;
    reg wr_clk = 0, rd_clk = 0;
    reg wr_en = 0, rd_en = 0;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    async_fifo dut (.data_in(data_in), .wr_clk(wr_clk), .rd_clk(rd_clk),
                    .wr_en(wr_en), .rd_en(rd_en), .data_out(data_out),
                    .full(full), .empty(empty));

    always #4 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    initial begin
        #10;
        repeat (8) begin
            @(posedge wr_clk); wr_en = 1; data_in = $random;
        end
        wr_en = 0;

        #30;

        repeat (8) begin
            @(posedge rd_clk); rd_en = 1;
        end
        rd_en = 0;
        #20 $finish;
    end
endmodule

