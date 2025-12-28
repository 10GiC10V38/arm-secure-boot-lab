# ARM Secure Boot Simulation (QEMU + U-Boot)

## Project Overview
This project implements a complete **Chain of Trust** for an ARMv8 platform. It demonstrates how to secure the boot process by enforcing RSA-2048 signature verification on the Linux Kernel before execution.

**Tech Stack:** U-Boot, QEMU (ARMv8), OpenSSL, Device Trees (DTS).

## Features
* **Automated Signing Pipeline:** Scripts to generate keys and sign FIT images.
* **Hardware Root of Trust:** Simulates fusing public keys into the Boot ROM (via Device Tree injection).
* **Tamper Detection:** The bootloader successfully blocks any kernel image modified by even 1 byte.

## How to Run

1.  **Install Dependencies:**
    ```bash
    ./scripts/setup_env.sh
    ```

2.  **Generate Keys:**
    ```bash
    ./scripts/generate_keys.sh
    ```

3.  **Sign the Kernel:**
    ```bash
    ./scripts/sign_image.sh
    ```

4.  **Run Simulation:**
    ```bash
    ./scripts/run_qemu.sh <path_to_your_u_boot_bin>
    ```

## Proof of Concept
**(Paste your logs here: One screenshot of "OK" and one screenshot of "Bad Data Hash")**
