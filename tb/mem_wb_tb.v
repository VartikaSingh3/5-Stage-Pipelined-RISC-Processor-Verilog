`timescale 1ns / 1ps

module mem_wb_tb;

reg clk;
reg reset;

reg [31:0] mem_data_in;

wire [31:0] mem_data_out;

mem_wb uut(

    .clk(clk),
    .reset(reset),

    .mem_data_in(mem_data_in),
    .mem_data_out(mem_data_out)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    mem_data_in = 0;

    #10;
    reset = 0;

    mem_data_in = 32'd100;

    #10;

    mem_data_in = 32'd200;

    #10;

    mem_data_in = 32'd300;

    #10;

    $finish;

end

endmodule
