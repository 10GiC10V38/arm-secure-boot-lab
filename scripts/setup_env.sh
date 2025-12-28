#!/bin/bash
# Installs necessary dependencies for Ubuntu/Debian
sudo apt-get update
sudo apt-get install -y git make gcc gcc-aarch64-linux-gnu \
    qemu-system-arm u-boot-tools device-tree-compiler \
    libssl-dev bison flex python3-pyelftools
echo "Dependencies installed."
