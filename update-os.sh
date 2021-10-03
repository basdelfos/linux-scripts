#!/bin/bash

echo "[*] Update APT repositories"
sudo apt update

echo ""
echo "[*] Execute distibution update"
sudo apt dist-upgrade -y

echo ""
echo "[*] Autoremove unused repositories"
sudo apt autoremove -y

echo ""
needs-reboot.sh