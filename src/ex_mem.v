`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ex_mem(

    input clk,
    input reset,

    input [31:0] alu_result_in,
    input [31:0] write_data_in,

    output reg [31:0] alu_result_out,
    output reg [31:0] write_data_out

);

always @(posedge clk or posedge reset) begin

    if(reset) begin

        alu_result_out <= 32'b0;
        write_data_out <= 32'b0;

    end

    else begin

        alu_result_out <= alu_result_in;
        write_data_out <= write_data_in;

    end

end

endmodule
