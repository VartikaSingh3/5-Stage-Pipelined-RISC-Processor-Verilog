`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module single_cycle_processor(

    input clk,
    input reset

);

// PC wires
wire [31:0] pc_out;

// Instruction Memory wires
wire [31:0] instruction;

// IF/ID wires
wire [31:0] if_id_pc;
wire [31:0] if_id_instruction;

// Control Unit wires
wire reg_write;
wire mem_read;
wire mem_write;
wire [2:0] alu_control;

// Register File wires
wire [31:0] read_data1;
wire [31:0] read_data2;

// ID/EX wires
wire [31:0] id_ex_read_data1;
wire [31:0] id_ex_read_data2;

// ALU result wire

wire [31:0] alu_result;
wire zero;

// Data Memory wire

wire [31:0] memory_data;

// EX/MEM wires
wire [31:0] ex_mem_alu_result;
wire [31:0] ex_mem_write_data;

// MEM/WB wires
wire [31:0] mem_wb_data;

// Program Counter
pc PC(

    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)

);

// Instruction Memory
instruction_memory IM(

    .address(pc_out),
    .instruction(instruction)

);

if_id IF_ID(

    .clk(clk),
    .reset(reset),

    .pc_in(pc_out),
    .instruction_in(instruction),

    .pc_out(if_id_pc),
    .instruction_out(if_id_instruction)

);

// Control Unit
control_unit CU(

    .opcode(if_id_instruction[31:28]),

    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_control(alu_control)

);

// Register File

register_file RF(

    .clk(clk),

    .reg_write(reg_write),

    .read_reg1(5'd1),
    .read_reg2(5'd2),

    .write_reg(5'd2),

    .write_data(mem_wb_data),

    .read_data1(read_data1),
    .read_data2(read_data2)

);

alu ALU(

    .a(id_ex_read_data1),
    .b(id_ex_read_data2),

    .alu_control(alu_control),

    .result(alu_result),

    .zero(zero)

);

id_ex ID_EX(

    .clk(clk),
    .reset(reset),

    .read_data1_in(read_data1),
    .read_data2_in(read_data2),

    .read_data1_out(id_ex_read_data1),
    .read_data2_out(id_ex_read_data2)

);

ex_mem EX_MEM(

    .clk(clk),
    .reset(reset),

    .alu_result_in(alu_result),
    .write_data_in(id_ex_read_data2),

    .alu_result_out(ex_mem_alu_result),
    .write_data_out(ex_mem_write_data)

);

// Data Memory

data_memory DM(

    .clk(clk),

    .mem_read(mem_read),
    .mem_write(mem_write),

    .address(ex_mem_alu_result),

    .write_data(ex_mem_write_data),

    .read_data(memory_data)

);

mem_wb MEM_WB(

    .clk(clk),
    .reset(reset),

    .mem_data_in(memory_data),

    .mem_data_out(mem_wb_data)

);

endmodule
