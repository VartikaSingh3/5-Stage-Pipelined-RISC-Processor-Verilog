`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module id_ex(

    input clk,
    input reset,

    input [31:0] read_data1_in,
    input [31:0] read_data2_in,

    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out

);

always @(posedge clk or posedge reset) begin

    if(reset) begin

        read_data1_out <= 0;
        read_data2_out <= 0;

    end

    else begin

        read_data1_out <= read_data1_in;
        read_data2_out <= read_data2_in;

    end

end

endmodule
