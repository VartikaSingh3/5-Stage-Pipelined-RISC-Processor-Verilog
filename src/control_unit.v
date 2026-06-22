`timescale 1ns / 1ps


module control_unit(

    input [3:0] opcode,

    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg [2:0] alu_control

);

always @(*) begin

    reg_write = 0;
    mem_read = 0;
    mem_write = 0;
    alu_control = 3'b000;

    case(opcode)

        4'b0000: begin
            reg_write = 1;
            alu_control = 3'b000; // ADD
        end

        4'b0001: begin
            reg_write = 1;
            alu_control = 3'b001; // SUB
        end

        4'b0010: begin
            reg_write = 1;
            mem_read = 1;
        end

        4'b0011: begin
            mem_write = 1;
        end

    endcase

end

endmodule
