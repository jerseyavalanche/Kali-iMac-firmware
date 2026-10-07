#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
if [[ $EUID -ne 0 ]]; then
  echo 'Run: sudo bash install.sh'
  exit 1
fi
if ! lspci -n -d 14e4:432b | grep -q .; then
  echo 'BCM4322 (14e4:432b) not detected. Stopping.'
  exit 1
fi
sha256sum --quiet -c SHA256SUMS
if [[ -d /lib/firmware/b43 ]]; then
  backup=$(mktemp -d /var/tmp/b43-backup.XXXXXX)
  cp -a /lib/firmware/b43 "$backup/"
  echo "Existing firmware backed up to $backup"
fi
install -d -m 755 /lib/firmware/b43
install -m 644 b43/*.fw /lib/firmware/b43/
echo 'Firmware installed. Reloading Wi-Fi driver...'
if ! modprobe -r b43; then
  echo 'Firmware copied, but driver could not unload. Send a photo of this output.'
  exit 1
fi
modprobe b43
if command -v nmcli >/dev/null; then
  nmcli radio wifi on || true
fi
echo 'Done. Wait 10 seconds, then open the network menu and choose your Wi-Fi.'
echo 'Kali Live without persistence loses this installation on reboot.'
echo 'Keep this bundle on your SD card so you can run it again if needed.'
