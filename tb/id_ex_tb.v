`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module id_ex_tb;

reg clk;
reg reset;

reg [31:0] read_data1_in;
reg [31:0] read_data2_in;

wire [31:0] read_data1_out;
wire [31:0] read_data2_out;

id_ex uut(

    .clk(clk),
    .reset(reset),

    .read_data1_in(read_data1_in),
    .read_data2_in(read_data2_in),

    .read_data1_out(read_data1_out),
    .read_data2_out(read_data2_out)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    read_data1_in = 0;
    read_data2_in = 0;

    #10;

    reset = 0;

    read_data1_in = 32'd100;
    read_data2_in = 32'd200;

    #10;

    read_data1_in = 32'd300;
    read_data2_in = 32'd400;

    #10;

    $finish;

end

endmodule
