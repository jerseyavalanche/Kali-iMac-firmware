# Kali-iMac-firmware

Driver and firmware setup for Kali Linux on the iMac.

## Status

Repository initialized. Hardware identification and the required driver/firmware files are pending. No firmware binaries or installation scripts have been uploaded yet.

## Identify the network hardware

Run in the iMac's Kali terminal:

```sh
lspci -nnk | grep -A3 -Ei 'network|wireless|ethernet'
```

Use the reported device IDs and active kernel driver to select the appropriate packages before adding installation steps.
