`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module if_id_tb;

reg clk;
reg reset;

reg [31:0] pc_in;
reg [31:0] instruction_in;

wire [31:0] pc_out;
wire [31:0] instruction_out;

if_id uut(

    .clk(clk),
    .reset(reset),

    .pc_in(pc_in),
    .instruction_in(instruction_in),

    .pc_out(pc_out),
    .instruction_out(instruction_out)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    pc_in = 0;
    instruction_in = 0;

    #10;

    reset = 0;

    pc_in = 32'd4;
    instruction_in = 32'h10000000;

    #10;

    pc_in = 32'd8;
    instruction_in = 32'h20000000;

    #10;

    $finish;

end

endmodule
