# Systolic Array Matrix Multiplication SoC  
**Zynq-7000 SoC-Based Scalable Parallel Matrix Multiplier**

This project implements a parameterizable systolic array-based matrix multiplier, optimized for square matrices (4×4, 8×8, and 16×16). Designed on the Zynq-7000 platform, it integrates the Processing System (PS) and Programmable Logic (PL) for high-throughput matrix multiplication using AXI DMA communication and dual systolic arrays.

## Features

- Matrix sizes supported: 4×4, 8×8, 16×16
- Dual-array parallelism for concurrent matrix pair processing
- Scalable design with selectable systolic array size
- Custom IP modules: `bram_reader`, `bram_writer`, `data_extractor`, `data_feeder`, `systolic_array`
- AXI DMA integration between PS and PL
- Comprehensive modular and full-system verification using testbenches and ILA

## Architecture Overview

### Programmable Logic (PL)

- **Systolic Arrays (4×4 and 8×8):** Core computation units for matrix multiplication
- **Data Extractors (A & B):** Rearrange input BRAM data into streams for the processing elements (PEs)
- **Data Feeder:** Coordinates feeding operations and controls synchronous input delivery
- **BRAMs:** Used for input buffering and output result storage
- **Custom IPs:**
  - `bram_writer`: Writes streamed data to BRAM
  - `bram_reader`: Reads computed data from BRAM for transfer

### Processing System (PS)

- **AXI DMA Controller:** Sends data and control words to PL using AXI Stream
- **Configuration Word Format (32-bit):**
  - Bits 0–4: Matrix size for systolic array 1
  - Bits 5–9: Matrix size for systolic array 2
  - Bits 10–11: Parallel execution enable bits
  - Remaining bits: Reserved

## Performance Optimization

- Dual systolic arrays allow parallel matrix multiplications
- Dynamic selection between 4×4 and 8×8 array based on input size
- Efficient data flow through DMA and BRAM interfacing
- Instruction-level parallelism enabled by pipelined data feeding

## Verification and Testing

### Module-Level Simulation

- RTL testbenches were developed for each module:
  - Systolic arrays
  - BRAM read/write modules
  - Data extractors and feeders

### System-Level Simulation

- Combined PL modules tested using `.coe`-initialized BRAM with known inputs and outputs
- DMA and AXI stream interface tested via a custom inverter IP
- Final integration verified using ILA instrumentation and software validation

## Usage and Simulation

1. **Vivado Design Flow:**
   - Synthesize and implement the design
   - Integrate custom IPs and generate the bitstream
2. **Software Development:**
   - Load the PS-side driver application to configure DMA and prepare data
3. **Simulation:**
   - Optional testbench simulation using ModelSim/Vivado Simulator
   - Validate matrix multiplication accuracy and throughput
4. **Debugging:**
   - Use Integrated Logic Analyzer (ILA) to trace signals and timing
