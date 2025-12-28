#!/bin/bash
# Runs QEMU with the custom Device Tree

echo "Starting QEMU... (Press Ctrl+A, then X to exit)"
echo "Inside U-Boot, run: 'dhcp; tftp 0x44000000 image.fit; bootm 0x44000000'"

# Note: We assume u-boot.bin is in the root or build dir. 
# For this repo, we will ask the user to provide the path to their binary.
if [ -z "$1" ]; then
    echo "Usage: ./scripts/run_qemu.sh <path_to_u_boot_bin>"
    exit 1
fi

qemu-system-aarch64 -machine virt -cpu cortex-a57 -nographic \
  -bios "$1" \
  -dtb qemu.dtb \
  -netdev user,id=net0,tftp=$(pwd) \
  -device virtio-net-device,netdev=net0
