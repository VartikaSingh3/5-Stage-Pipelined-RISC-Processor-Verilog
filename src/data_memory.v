`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module data_memory(

    input clk,

    input mem_read,
    input mem_write,

    input [31:0] address,
    input [31:0] write_data,

    output reg [31:0] read_data

);

reg [31:0] memory [0:31];

integer i;

initial begin

    for(i = 0; i < 32; i = i + 1)
        memory[i] = 0;

    memory[0] = 100;
    memory[1] = 200;
    memory[2] = 300;

end

always @(*) begin

    if(mem_read)
        read_data = memory[address[31:2]];
    else
        read_data = 0;

end

always @(posedge clk) begin

    if(mem_write)
        memory[address[31:2]] <= write_data;

end

endmodule
