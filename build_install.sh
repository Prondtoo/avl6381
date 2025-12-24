#!/bin/bash
set -e

# Helper script for building and installing avl6381 driver on Ubuntu 24.04

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root (for installation steps)." 1>&2
   echo "Please run with sudo." 1>&2
   exit 1
fi

echo "Updating package lists and installing prerequisites..."
apt-get update
apt-get install -y build-essential linux-headers-$(uname -r) wget

echo "Cleaning previous builds..."
if [ -f Makefile.ubuntu ]; then
    make -f Makefile.ubuntu clean
fi

echo "Building modules..."
make -f Makefile.ubuntu

echo "Installing firmware..."
# The main firmware file mentioned in README
FW_FILE="firmware/dvb-usb-it9303-01.fw"
if [ -f "$FW_FILE" ]; then
    cp "$FW_FILE" /lib/firmware/
    echo "Copied $FW_FILE to /lib/firmware/"
else
    echo "Warning: Firmware file $FW_FILE not found in current directory!"
fi

echo "Installing modules..."
make -f Makefile.ubuntu install

echo "Done. Please plug in your device or reboot."
echo "You can check status with: dmesg | grep -i dvb"
