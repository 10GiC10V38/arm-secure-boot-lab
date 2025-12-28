#!/bin/bash
# 1. Creates a dummy kernel
# 2. Signs it using the private key
# 3. Injects the public key into the QEMU DTB

# Create dummy kernel if not exists
if [ ! -f "Image" ]; then
    echo "Creating dummy kernel (5MB)..."
    dd if=/dev/urandom of=Image bs=1M count=5 2>/dev/null
fi

# Extract QEMU DTB
echo "Extracting QEMU Device Tree..."
qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine dumpdtb=qemu.dtb

# Sign the image and inject key
echo "Signing image and injecting public key into DTB..."
mkimage -f configs/fit_image.its -k keys -K qemu.dtb -r image.fit

echo "Success! 'image.fit' is signed and 'qemu.dtb' contains the public key."
