#!/bin/bash

echo -e "[*] Update script Linux OS (debian-based)"
echo -e "[*] Version: 0.3"

#
# 0.1:  Initial version history
# 0.2:	Added CTRL-C keypress trap to terminate script
# 0.3:	Added commandline option to switch to default anwswer 'Y' to questions

# Trap CTRL-C keypress and call terminate()
trap terminate INT

function terminate() {
  echo -e "[-] CTRL-C pressed, terminating."
  exit 1
}

# Set default values
YES=""

# Progress commandline arguments
while getopts y flag; do
    case "${flag}" in
      y) 
        YES="-y"
	echo -e "[*] Continue without questions enabled, packages will be installed without notice"
	;;
    esac
done

echo -e "[*] Checking if login with sudo is needed"
sudo echo -e ""

echo -e "[*] Update APT repositories"
sudo apt update

echo -e ""
echo -e "[*] Execute distibution update"
sudo apt dist-upgrade $YES

echo -e ""
echo -e "[*] Autoremove unused repositories"
sudo apt autoremove $YES

echo -e ""
needs-reboot.sh

