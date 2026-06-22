`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module instruction_memory(

    input [31:0] address,
    output [31:0] instruction

);

reg [31:0] memory [0:31];

integer i;

initial begin

    for(i=0;i<32;i=i+1)
        memory[i] = 32'b0;

    memory[0] = 32'b0000_0000000000000000000000000000;
    memory[1] = 32'b0001_0000000000000000000000000000;
    memory[2] = 32'b0010_0000000000000000000000000000;
    memory[3] = 32'b0011_0000000000000000000000000000;

end

assign instruction = memory[address[31:2]];

endmodule
