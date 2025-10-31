#!/bin/sh
# Installer for third-party APKs into the rootfs overlay.
# USAGE: place APK files into third_party_apks/ and run this script.
# This script WILL REFUSE to install Facebook (facebook.apk) and will add hosts entries to block facebook domains.

OVERLAY=overlay/usr/local/apps
mkdir -p "$OVERLAY"
echo "Scanning third_party_apks/ for APKs..."
for apk in third_party_apks/*.apk; do
    [ -e "$apk" ] || continue
    name=$(basename "$apk")
    case "$name" in
        *facebook*.apk|*Facebook*.apk)
            echo "Facebook APK detected: $name — installation blocked by NamoOs policy."
            # add facebook domains to blocklist
            mkdir -p overlay/etc/
            echo "127.0.0.1 facebook.com" >> overlay/etc/hosts.block
            echo "127.0.0.1 www.facebook.com" >> overlay/etc/hosts.block
            ;;
        *)
            echo "Installing allowed APK: $name"
            cp "$apk" "$OVERLAY/"
            ;;
    esac
done
echo "Installer finished. Place overlay contents into Buildroot overlay to include in image."
