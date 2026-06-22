`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ex_mem_tb;

reg clk;
reg reset;

reg [31:0] alu_result_in;
reg [31:0] write_data_in;

wire [31:0] alu_result_out;
wire [31:0] write_data_out;

ex_mem uut (

    .clk(clk),
    .reset(reset),

    .alu_result_in(alu_result_in),
    .write_data_in(write_data_in),

    .alu_result_out(alu_result_out),
    .write_data_out(write_data_out)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    alu_result_in = 0;
    write_data_in = 0;

    #10;
    reset = 0;

    alu_result_in = 32'd100;
    write_data_in = 32'd200;

    #10;

    alu_result_in = 32'd300;
    write_data_in = 32'd400;

    #10;

    $finish;

end

endmodule
