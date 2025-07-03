`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 17:32:33
// Design Name: 
// Module Name: tb_dual_port_ram
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


// tb_dual_port_ram.v
module tb_dual_port_ram;
    reg clk_write = 0, clk_read = 0, write_en = 0, read_en = 0;
    reg [7:0] data_in;
    reg [3:0] write_addr = 0, read_addr = 0;
    wire [7:0] data_out;

    dual_port_ram dut (.data_in(data_in), .write_addr(write_addr), .read_addr(read_addr),
                       .write_en(write_en), .read_en(read_en), .clk_write(clk_write),
                       .clk_read(clk_read), .data_out(data_out));

    always #5 clk_write = ~clk_write;
    always #7 clk_read = ~clk_read;

    initial begin
        write_en = 1;
        data_in = 8'hA5; #10;
        write_en = 0;

        #30;
        read_en = 1; #14;
        read_en = 0;
        $finish;
    end
endmodule

