# Kali-iMac-firmware

Offline Broadcom BCM4322 (PCI ID `14e4:432b`) Wi-Fi firmware bundle for Kali Linux on Rich's iMac.

## Download and install

```sh
mkdir -p ~/Downloads
cd ~/Downloads
wget https://raw.githubusercontent.com/jerseyavalanche/Kali-iMac-firmware/main/Mac-WiFi.zip
unzip Mac-WiFi.zip
cd Mac-WiFi
sudo bash install.sh
```

The installer checks the PCI ID and firmware checksums, backs up existing b43 firmware, installs the files, and reloads the existing kernel b43 driver. It requires no firmware download or compiler during installation. Do not run the installer through a connection that depends on b43; the driver reload interrupts that connection.

Kali Live without persistence loses the installation at reboot. Keep the ZIP to reinstall.

## Files

- `Mac-WiFi.zip`: existing firmware bundle, 158 entries including firmware, checksums, README and installer.
- `install.sh`: editable copy of the installer included in the ZIP. Run the bundled copy inside its extracted directory.
- `PROVENANCE.txt`: original setup notes and firmware source details.
- `SHA256SUMS`: checksum of the downloadable ZIP.

The firmware files and their checksums were verified before upload. Hardware operation has not been tested on the iMac. This bundle supplies firmware; the b43 kernel driver must already be available in Kali.
