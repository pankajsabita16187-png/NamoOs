#!/bin/sh
set -e
echo "Run QEMU with the images produced by Buildroot (edit paths as needed)."
echo "Example:"
echo "qemu-system-arm -M virt -cpu cortex-a9 -m 512 -kernel output/images/zImage -append 'console=ttyAMA0,115200 root=/dev/vda rw' -drive if=none,file=output/images/rootfs.ext4,id=hd0 -device virtio-blk-device,drive=hd0 -nographic"
