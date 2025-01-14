#!/bin/bash

echo "ringOS beta builder for Fedora(-based) Linux"
echo "This script will ask you for password using sudo."
echo "Note: On Red Hat Enterprise Linux & CentOS, you might need to install the EPEL repository. "
echo "THIS SCRIPT HAS NOT BEEN TESTED AND IT IS EXTREMELY UNSTABLE! USE WITH CAUTION!!!!!!! IF YOU WANT TO IMPROVE, CONSIDER A PULL REQUEST."

sudo yum check-update && echo Check for update successful || echo FAILED to check for update
sudo yum group install "Development tools" && echo Development tools installed successfully || echo FAILED to install Development tools
sudo yum install nasm && echo NASM installed successfully || echo FAILED to install nasm
sudo yum install qemu-kvm && echo Qemu-kvm installed successfully || echo FAILED to install Qemu-kvm
sudo yum install git && echo git installed successfully || echo FAILED to install git
sudo yum install lld && echo lld installed successfully || echo FAILED to install lld
sudo yum install xorriso && echo xorriso installed successfully || echo FAILED to install xorriso
sudo yum install mkisofs && echo mkisofs installed successfully || echo FAILED to install mkisofs

git clone https://github.com/VanGutan/gnu-efi
mv bootloader gnu-efi/bootloader

cd gnu-efi && echo In gnu-efi directory || echo FAILED to enter gnu-efi directory
make bootloader && echo Bootloader successfully created || echo FAILED to create bootloader
cd ../kernel && echo In kernel directory || echo FAILED to enter kernel directory
make kernel && echo Kernel successfully created || echo FAILED to create kernel
make buildimg && echo Buildimg successfully created || echo FAILED to create buildimg
chmod +x ./ISO.sh
./ISO.sh
make run

cd ../
chmod +x ./clean.sh
./clean.sh

