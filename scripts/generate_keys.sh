#!/bin/bash
# Generates the RSA keys needed for signing

KEY_DIR="keys"
mkdir -p $KEY_DIR

if [ -f "$KEY_DIR/dev.key" ]; then
    echo "Keys already exist. Skipping generation to prevent overwriting."
else
    echo "Generating RSA 2048 keys..."
    # Generate Private Key
    openssl genrsa -F4 -out $KEY_DIR/dev.key 2048
    # Generate Public Key Certificate
    openssl req -batch -new -x509 -key $KEY_DIR/dev.key -out $KEY_DIR/dev.crt
    echo "Keys generated in $KEY_DIR/"
fi
