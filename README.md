# AXI4-Stream Vanilla RNN Accelerator on Zynq UltraScale+ MPSoC

## Overview

This repository presents a **Custom AXI4-Stream IP Core** implementing a **Vanilla Recurrent Neural Network (RNN) Accelerator** in **Pure Verilog-2001**, targeted for the **AMD Zynq UltraScale+ MPSoC ZCU102 FPGA Platform**.

The accelerator is designed to perform hardware-accelerated sequence processing and recurrent neural network inference using a streaming architecture based on the AXI4-Stream protocol. The design enables efficient data movement between programmable logic components while providing a scalable foundation for FPGA prototyping and ASIC implementation.

This project demonstrates RTL design, neural network hardware acceleration, AXI4-Stream custom IP development, FPGA prototyping, and FPGA-to-ASIC migration methodologies.

---

## Project Objectives

- Design a custom AXI4-Stream IP Core for RNN acceleration.
- Implement a Vanilla RNN inference engine in Verilog.
- Support streaming input and output data processing.
- Enable low-latency sequence inference.
- Develop a synthesizable FPGA architecture.
- Integrate with AMD Zynq UltraScale+ MPSoC.
- Demonstrate FPGA-based neural network acceleration.
- Establish a reusable architecture for ASIC prototyping.

---

## Target Platform

### FPGA Device

- AMD Zynq UltraScale+ MPSoC
- ZCU102 Evaluation Board

### Design Tools

- Vivado Design Suite
- Vivado IP Integrator
- Vivado Simulator
- Xilinx Synthesis
- Xilinx Implementation Flow

---

## Architecture

The accelerator consists of multiple hardware modules connected through an AXI4-Stream interface.

```text
                    +-------------------+
                    | AXI4-Stream Slave |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | Input Buffer      |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | Weight Memory     |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | MAC Engine        |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | Hidden State Unit |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | Activation Unit   |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | Output Buffer     |
                    +---------+---------+
                              |
                              v
                    +-------------------+
                    | AXI4-Stream Master|
                    +-------------------+
```

---

## Features

### Neural Network Features

- Vanilla RNN Architecture
- Hidden State Computation
- Sequence Processing
- Recurrent Feedback Path
- Configurable Hidden Layer Size
- Fixed-Point Arithmetic Support

### AXI4-Stream Features

- AXI4-Stream Slave Interface
- AXI4-Stream Master Interface
- Streaming Data Processing
- Backpressure Support
- TVALID/TREADY Handshake
- TLAST Support

### FPGA Features

- Fully Synthesizable RTL
- Pure Verilog-2001 Implementation
- BRAM-Based Weight Storage
- DSP Utilization for MAC Operations
- Vivado Compatible
- ZCU102 Ready

---

## Design Flow

```text
Neural Network Model
          │
          ▼
RTL Design (Verilog)
          │
          ▼
Functional Verification
          │
          ▼
AXI4-Stream Integration
          │
          ▼
Synthesis
          │
          ▼
Implementation
          │
          ▼
Bitstream Generation
          │
          ▼
ZCU102 FPGA Validation
```

---

## Directory Structure

```text
AXI4-Stream-Vanilla-RNN-Accelerator-on-Zynq-UltraScale-MPSoC/
│
├── rtl/
│   ├── rnn_top.v
│   ├── axi_stream_slave.v
│   ├── axi_stream_master.v
│   ├── rnn_controller.v
│   ├── hidden_state_unit.v
│   ├── mac_engine.v
│   ├── activation_function.v
│   ├── weight_memory.v
│   ├── input_buffer.v
│   └── output_buffer.v
│
├── tb/
│   ├── tb_rnn_top.v
│   └── test_vectors.mem
│
├── constraints/
│   └── zcu102.xdc
│
├── scripts/
│   ├── synth.tcl
│   └── impl.tcl
│
├── reports/
│   ├── utilization.rpt
│   ├── timing_summary.rpt
│   └── power_report.rpt
│
├── block_design/
│   └── rnn_accelerator_bd.tcl
│
├── docs/
│   ├── architecture.pdf
│   └── waveform_results.pdf
│
└── README.md
```

---

## AXI4-Stream Interface

### Input Stream

| Signal | Description |
|----------|------------|
| S_AXIS_TDATA | Input Data |
| S_AXIS_TVALID | Input Valid |
| S_AXIS_TREADY | Ready Signal |
| S_AXIS_TLAST | End of Sequence |

### Output Stream

| Signal | Description |
|----------|------------|
| M_AXIS_TDATA | Output Data |
| M_AXIS_TVALID | Output Valid |
| M_AXIS_TREADY | Ready Signal |
| M_AXIS_TLAST | End of Sequence |

---

## Verification

### Functional Verification

Verified:

- Hidden State Updates
- MAC Operations
- AXI4-Stream Handshaking
- Activation Function Outputs
- Sequence Processing
- Output Correctness

### Testbench Features

- Self-Checking Verification
- AXI4-Stream Transaction Generator
- Sequence Input Stimulus
- Output Comparison
- Waveform Generation

---

## Synthesis Results

| Metric | Result |
|----------|---------|
| Synthesis | ✅ Pass |
| Implementation | ✅ Pass |
| Bitstream Generation | ✅ Pass |
| Timing Closure | ✅ Pass |
| Functional Verification | ✅ Pass |

---

## Performance Metrics

### Design Targets

- High Throughput Streaming
- Low Latency Inference
- Resource Efficient Architecture
- Scalable Hidden Layer Design

### FPGA Optimization Goals

- Reduced BRAM Utilization
- DSP Efficient Computation
- Optimized AXI Throughput
- Pipelined Data Path

---

## Applications

This accelerator can be used for:

- Sequence Prediction
- Time Series Analysis
- Edge AI Systems
- FPGA-Based Machine Learning
- Embedded AI Inference
- Signal Processing
- Industrial Automation
- Predictive Analytics

---

## Key Learning Outcomes

- AXI4-Stream Protocol Implementation
- Neural Network Hardware Acceleration
- FPGA-Based AI Inference
- Verilog RTL Design
- Hardware-Software Co-Design
- AMD Zynq UltraScale+ Development
- DSP-Based Computation
- FPGA-to-ASIC Migration Flow

---

## Future Enhancements

- LSTM Accelerator Support
- GRU Accelerator Support
- Multi-Layer RNN Architecture
- AXI4-Lite Configuration Interface
- DMA Integration
- Quantized Neural Networks
- HLS Comparison Study
- ASIC Implementation Flow

---

## Project Status

### ✅ Completed

- RTL Architecture Development
- AXI4-Stream Interface Design
- RNN Compute Engine Design
- Functional Verification
- FPGA Synthesis
- ZCU102 Integration

### 🚀 Future Work

- Multi-Layer RNN Support
- Hardware Benchmarking
- ASIC Prototyping
- Research Publication

---

## Author

**Nandini Kendre**

Senior Research Fellow – C2S Program (MeitY)  
FPGA / ASIC Design Engineer

### Research Areas

- Digital VLSI Design
- FPGA Prototyping
- Neural Network Accelerators
- ASIC Physical Design
- Hardware Acceleration
- Edge AI Systems
- RTL-to-GDSII Design Flow
