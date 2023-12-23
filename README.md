# SynthOS: FPGA Synthesis Operating System

## Overview

SynthOS is a live operating system based on Ubuntu Server, tailored for FPGA (Field Programmable Gate Array) synthesis using High-Level Synthesis (HLS) tools. It simplifies the process of synthesizing C/C++ code for FPGA deployment by providing a ready-to-use environment with all necessary tools pre-installed. SynthOS is ideal for use on personal computers, virtual machines, and AWS EC2 instances for enhanced computing power. The OS includes a demo project for matrix multiplication to help users get started.

## Getting Started

### Booting into SynthOS

1. **Download SynthOS ISO Image**: Obtain the ISO image of SynthOS.
2. **Create a Bootable USB Drive or Setup a VM**: Use the ISO to create a bootable USB drive or configure a virtual machine or AWS EC2 instance.
3. **Boot from USB Drive or Start VM/EC2 Instance**: Boot your system from the USB or launch the VM/EC2 instance.
4. **Login to the Instance**: The default username is ```synthos``` and the default password is ```HIGHLEVELSYNTHESIS```.

### Using SynthOS

1. **Open Terminal**: Access the terminal in SynthOS.
2. **Run Synthesis Script**:
   - Use `synthesis_project.sh` script to either run your own project or the demo project:

     ```bash
     ./synthesis_project.sh
     ```
   - Follow the prompts to either input your project's GitHub repo URL (see the [demo project](https://github.com/mbulling/SynthOS/tree/main/project_src) for how your project should be structured) or use the demo matrix multiplication project.
3. **FPGA Synthesis**:
   - The script facilitates the synthesis process, making it easy to compile and prepare your code for FPGA deployment.

## Configuration

- Modify `synthesis_settings.cfg` to customize synthesis settings.
- Ensure the script points to the correct HLS tools and project files (by default this is done for you).

## Project Structure

- **Demo Project**: Sample matrix multiplication code (`matrix_multiplication.cpp/h` and `testbench`).
- **Scripts**: `synthesis_project.sh` for running synthesis and `run_synthesis.tcl` for HLS.
- **Config File**: `synthesis_settings.cfg` for managing synthesis settings.

## Customizing for Your Project

1. Place your C/C++ project files in the SynthOS environment.
2. Use `synthesis_project.sh` to specify your project repository or select the demo project.
3. Modify synthesis settings in `synthesis_settings.cfg` as required.

## Dependencies

- SynthOS includes all necessary dependencies, including HLS tools and GCC for C++.
