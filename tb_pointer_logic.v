`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 18:00:32
// Design Name: 
// Module Name: tb_pointer_logic
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


module tb_pointer_logic;
    reg clk = 0, rst = 1, inc = 0;
    wire [3:0] bin_ptr, gray_ptr;

    pointer_logic #(4) dut (.clk(clk), .rst(rst), .inc_en(inc), .bin_ptr(bin_ptr), .gray_ptr(gray_ptr));

    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;
        repeat (10) begin
            #10 inc = 1;
            #10 inc = 0;
        end
        $finish;
    end
endmodule

