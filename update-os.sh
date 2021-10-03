#!/bin/bash

echo -e "[*] Update script Linux OS (debian-based)"
echo -e "[*] Version: 0.1"

#
# 0.1:    Initial version history
# 0.2:    Added CTRL-C keypress trap to terminate script

# Trap CTRL-C keypress and call terminate()
trap terminate INT

function terminate() {
  echo -e "[-] CTRL-C pressed, terminating."
  exit 1
}

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