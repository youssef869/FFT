# RTL to GDS Implementation of FFT based on SDF Architecture

Implementation of an 8-point Radix-2 DIF FFT using a Single-path Delay Feedback (SDF) architecture, starting from MATLAB system modeling and fixed-point analysis through RTL design, verification, and ASIC implementation. The design was then scaled to 64 points and implemented on an Artix-7 FPGA.

## Project Flow

* System Modeling
* RTL Design
* RTL Verification
* ASIC Implementation
* Scaling to 64-point FFT
* FPGA Implementation

## System Modeling

The FFT algorithm was developed and modeled in MATLAB.

The implemented FFT is:

* 8-point
* Radix-2
* Decimation-in-Frequency (DIF)
* Natural input order
* Bit-reversed output order

Fixed-point analysis was performed using a 12-bit word length to determine the integer and fractional parts of the signals. SQNR was also measured by comparing the fixed-point implementation with MATLAB's double-precision FFT.

## RTL Design

The FFT was implemented in SystemVerilog using a Single-path Delay Feedback (SDF) architecture.

Each stage contains a delay buffer and butterfly operations, with an FSM controlling the data flow through the stage.

The main FSM states are:

* `IDLE_S`
* `FILL_S`
* `BF_S`
* `DRAIN_S`

The 8-point FFT has a latency of 7 clock cycles.

## RTL Verification

A directed test case was first used to verify the design and debug the different FFT stages.

```text
[1, 0, 2, 0, 3, 0, 4, 0]
```

MATLAB was then used as a reference model. Test vectors were generated and compared with the RTL output.

Results for the 8-point design:

* Latency: 7 cycles
* Code coverage: 84.08%

## ASIC Implementation

The 8-point FFT was implemented through an ASIC flow including synthesis, floorplanning, placement and routing, timing analysis, and physical verification.

### OpenLane

The design was implemented using the SkyWater 130 nm technology.

| Metric                 |          Result |
| ---------------------- | --------------: |
| Maximum Frequency      |        42.6 MHz |
| Setup WNS              |         1.56 ns |
| Setup TNS              |            0 ns |
| Hold WNS               |         0.12 ns |
| Hold TNS               |            0 ns |
| Post-route Utilization |             22% |
| Technology             | SkyWater 130 nm |

### Adflow

The design was also implemented using Adflow targeting GF 22 nm.

Physical verification was performed using Siemens Calibre.

| Metric                 |    Result |
| ---------------------- | --------: |
| Maximum Frequency      | 619.5 MHz |
| Setup WNS              |  3.386 ns |
| Setup TNS              |      0 ns |
| Hold WNS               |      0 ns |
| Hold TNS               |      0 ns |
| Post-route Utilization |     59.7% |
| Technology             |  GF 22 nm |

## 64-point FFT

The design was scaled from 8 points to 64 points by taking advantage of the regular SDF architecture and parameterization.

Results:

* 64-point FFT
* 6 SDF stages
* Average SQNR: 50.35 dB
* Latency: 63 cycles
* Code coverage: 86.66%

## FPGA Implementation

The 64-point FFT was implemented using Xilinx Vivado on an Artix-7 FPGA.

The Vivado flow included synthesis, implementation, timing, utilization, and power analysis.

## Tools

* MATLAB
* SystemVerilog
* OpenLane
* Adflow
* Xilinx Vivado
* Siemens Calibre
