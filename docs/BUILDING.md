# Building NamoOs (prototype)

This document gives a high-level sequence to build the prototype using Buildroot and QEMU.
This is a scaffold and will require installing Buildroot, cross-toolchain, Qt dev packages, qemu-user/qemu-system, etc.

## Quick steps (host: Ubuntu/Debian)
1. Install dependencies:
   sudo apt update
   sudo apt install -y build-essential git curl python3 qemu-system-arm gcc-arm-linux-gnueabihf        libqt5* buildroot

2. Prepare Buildroot (this repo includes a `buildroot/` folder with a defconfig):
   cd NamoOs_project/buildroot
   make mymobileos_defconfig
   make -j$(nproc)

3. After Buildroot produces images, run:
   ../build/run_qemu.sh

Notes:
- This scaffold uses a generic ARM emulation target; adjust `run_qemu.sh` for your host/target.
- To add proprietary APKs (WhatsApp, Instagram, Google services): place them into `third_party_apks/` and run `scripts/install_apps.sh`.
- Facebook is intentionally blocked by the installer and by a hosts file entry in `antivirus/rules/hosts.block`.
