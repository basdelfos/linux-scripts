#!/bin/bash

echo -e "[*] Update script Linux OS (debian-based)"
echo -e "[*] Version: 0.1"

#
# 0.1:    Initial version history

echo -e "[*] Checking if login with sudo is needed"
sudo echo -e ""

echo -e "[*] Update APT repositories"
sudo apt update

echo -e ""
echo -e "[*] Execute distibution update"
sudo apt dist-upgrade -y

echo -e ""
echo -e "[*] Autoremove unused repositories"
sudo apt autoremove -y

echo -e ""
needs-reboot.sh