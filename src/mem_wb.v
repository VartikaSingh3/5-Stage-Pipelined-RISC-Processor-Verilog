`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module mem_wb(

    input clk,
    input reset,

    input [31:0] mem_data_in,

    output reg [31:0] mem_data_out

);

always @(posedge clk or posedge reset) begin

    if(reset)
        mem_data_out <= 32'b0;

    else
        mem_data_out <= mem_data_in;

end

endmodule
