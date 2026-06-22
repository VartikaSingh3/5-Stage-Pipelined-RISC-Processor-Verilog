# 🚀 5-Stage Pipelined RISC Processor using Verilog HDL

A complete implementation of a **5-Stage Pipelined RISC Processor** designed in **Verilog HDL** and simulated using **Xilinx Vivado**. This project demonstrates the fundamental concepts of Computer Architecture, Digital Design, Pipeline Processing, and Hardware Description Languages.

---

## 📌 Project Overview

Modern processors improve performance using **instruction pipelining**, where multiple instructions are executed simultaneously across different stages of execution.

This project implements a simplified **5-stage pipelined processor** with dedicated pipeline registers between stages. The design was developed, integrated, and verified through simulation waveforms and schematic analysis in Xilinx Vivado.

---

## 🎯 Objectives

- Understand processor architecture fundamentals
- Implement a pipelined datapath using Verilog
- Design and verify individual hardware modules
- Integrate pipeline stages into a complete processor
- Analyze processor behavior through RTL simulation

---

# 🏗️ Processor Architecture

The processor follows the classic **5-stage RISC pipeline architecture**:

```text
Instruction Fetch
       │
       ▼
   IF / ID
       │
       ▼
Instruction Decode
       │
       ▼
   ID / EX
       │
       ▼
    Execute
       │
       ▼
   EX / MEM
       │
       ▼
 Memory Access
       │
       ▼
   MEM / WB
       │
       ▼
   Write Back
```

---

# ⚙️ Pipeline Stages

## 1️⃣ Instruction Fetch (IF)

- Program Counter (PC) generates instruction address
- Instruction Memory fetches instruction
- PC increments every clock cycle

### Modules
- Program Counter (PC)
- Instruction Memory

---

## 2️⃣ Instruction Decode (ID)

- Instruction opcode is decoded
- Control signals are generated
- Register File provides operand values

### Modules
- Control Unit
- Register File

---

## 3️⃣ Execute (EX)

- Arithmetic and logical operations are performed
- ALU executes instructions according to control signals

### Modules
- ALU

---

## 4️⃣ Memory Access (MEM)

- Load and Store operations
- Data Memory access

### Modules
- Data Memory

---

## 5️⃣ Write Back (WB)

- Computed data is written back to the register file

---

# 🔄 Pipeline Registers

To maintain instruction flow between stages, dedicated pipeline registers are implemented:

| Pipeline Register | Function |
|------------------|-----------|
| IF/ID | Stores fetched instruction and PC |
| ID/EX | Stores decoded operands |
| EX/MEM | Stores ALU result and memory data |
| MEM/WB | Stores final result for write-back |

---

# 🧩 Implemented Modules

### Core Modules

- Program Counter (PC)
- Instruction Memory
- Control Unit
- Register File
- ALU
- Data Memory

### Pipeline Registers

- IF/ID Register
- ID/EX Register
- EX/MEM Register
- MEM/WB Register

---

# 📂 Project Structure

```text
Pipelined_Processor
│
├── src
│   ├── pc.v
│   ├── instruction_memory.v
│   ├── control_unit.v
│   ├── register_file.v
│   ├── alu.v
│   ├── data_memory.v
│   ├── if_id.v
│   ├── id_ex.v
│   ├── ex_mem.v
│   ├── mem_wb.v
│   └── pipelined_processor.v
│
├── tb
│   ├── pc_tb.v
│   ├── alu_tb.v
│   ├── if_id_tb.v
│   ├── id_ex_tb.v
│   ├── ex_mem_tb.v
│   ├── mem_wb_tb.v
│   └── pipelined_processor_tb.v
│
├── screenshots
│   ├── schematic.png
│   ├── top_level_waveform.png
│   ├── if_id_waveform.png
│   ├── id_ex_waveform.png
│   ├── ex_mem_waveform.png
│   └── mem_wb_waveform.png
│
└── README.md
```

---

# 🔍 Workflow

```text
PC
 │
 ▼
Instruction Memory
 │
 ▼
IF/ID Register
 │
 ▼
Control Unit + Register File
 │
 ▼
ID/EX Register
 │
 ▼
ALU
 │
 ▼
EX/MEM Register
 │
 ▼
Data Memory
 │
 ▼
MEM/WB Register
 │
 ▼
Write Back
```

---

# 🧪 Verification

All modules were verified through dedicated Verilog testbenches.

### Verified Components

✅ Program Counter

✅ Instruction Memory

✅ Control Unit

✅ Register File

✅ ALU

✅ Data Memory

✅ IF/ID Register

✅ ID/EX Register

✅ EX/MEM Register

✅ MEM/WB Register

✅ Complete Processor Integration

---

# 📊 Simulation Results

The processor behavior was verified using:

- Functional Simulation
- RTL Waveform Analysis
- Elaborated Design Schematic

Simulation confirms:

- Correct instruction flow
- Proper pipeline register operation
- Accurate ALU execution
- Successful memory access
- Correct stage-to-stage data transfer

---

# 🛠️ Tools Used

- Verilog HDL
- Xilinx Vivado
- RTL Simulation
- Digital Design Methodology

---

# 🚧 Future Improvements

The current implementation focuses on pipeline architecture and stage integration.

Future enhancements may include:

- Hazard Detection Unit
- Data Forwarding Unit
- Branch Prediction
- Pipeline Stalling Logic
- Complete RISC Instruction Set Support

---

# 📚 Learning Outcomes

Through this project:

- Developed a strong understanding of pipelined processor architecture
- Gained practical experience with Verilog HDL
- Learned RTL design and simulation workflows
- Understood stage synchronization using pipeline registers
- Explored processor datapath implementation

---

# 👩‍💻 Author

**Vartika Singh**

B.Tech Electronics & Communication Engineering (ECE)

---

⭐ If you found this project useful, consider giving it a star.
