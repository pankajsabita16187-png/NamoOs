# NamoOs — Custom Mobile Linux (Prototype)

**NamoOs** is a custom Linux-based mobile OS project scaffold. This archive contains the full GitHub-style project layout:
- Buildroot configuration and instructions
- Kernel config stubs
- Systemd init units and init scripts
- Qt/QML UI shell (simple)
- Antivirus subsystem (scanner stubs, sandbox script, rule files)
- Apps folder with placeholders for WhatsApp, Google services, Instagram, and Facebook (Facebook is intentionally blocked)
- Installer script that installs allowed third-party APKs if you provide them (no proprietary binaries are included)

**Important:** This project is a prototype scaffold. It does NOT contain proprietary apps (WhatsApp, Google Play Services, Instagram, Facebook) or device-specific drivers. To include those apps you must obtain their APKs or binaries from legal sources and place them into `third_party_apks/` before running the installer.

## What this ZIP provides
- A ready-to-edit repo layout to build NamoOs using Buildroot or adapt to Yocto.
- Scripts to assemble a QEMU-bootable image (emulation depends on your host).
- Antivirus sandboxing and rules that block Facebook domains and block the Facebook app from being installed.
- `install_apps.sh` script which will only install allowed apps (WhatsApp, Google, Instagram) if you supply their APKs; it will skip/block Facebook and add Facebook domains to hosts-based blocking.

## How to use
1. Extract this ZIP.
2. Read `docs/BUILDING.md` for build steps (Buildroot required).
3. Place any third-party APKs in `third_party_apks/` (optional). **Do not** include APKs in this repo.
4. Run `scripts/install_apps.sh` to copy allowed APKs into the system rootfs overlay for packaging. Facebook APK will be rejected by the installer.
5. Build NamoOs with `build/build.sh` and run with `build/run_qemu.sh` or deploy to hardware.

## License & legal
All scaffold code in this repo is provided under the MIT License (see LICENSE). Proprietary apps and vendor firmware are not included. You are responsible for obtaining licenses for any proprietary binaries you add.

