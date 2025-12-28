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
    *Note: Since the U-Boot binary is large and architecture-specific, it is not included in this repository. Please point this argument to your locally compiled `u-boot.bin`.*

## Proof of Concept

### 1. Authorized Boot (Success)
The bootloader verifies the digital signature against the public key stored in the Device Tree. Since the signature matches, the kernel is allowed to boot.
* **Observation:** Note the `sha256,rsa2048:dev+ OK` confirmation.

<img width="890" alt="Successful Boot Log" src="https://github.com/user-attachments/assets/34c76b9a-3f9c-4777-ba79-bf4d8742b6a8" />

<br>

### 2. Tampered Boot (Security Enforcement)
After modifying the kernel image by just a few bytes, the verification fails. The bootloader correctly detects the corruption and halts the boot process.
* **Observation:** Note the `Bad Data Hash` and `ERROR: can't get kernel image!` messages.

<img width="890" alt="Failed Boot Log - Tamper Detection" src="https://github.com/user-attachments/assets/e0f54174-6e49-4ca6-ab87-9310867422b3" />
