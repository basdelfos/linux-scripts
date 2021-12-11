#!/bin/bash

#
# 0.1:  Initial version history
# 0.2:  Added CTRL-C keypress trap to terminate script
# 0.3:  Added commandline option to switch to default anwswer 'Y' to questions
# 0.4:  Added terminal colors

FG_RED="\e[1m\e[31m"
FG_YLW="\e[1m\e[33m"
FG_GRE="\e[1m\e[32m"
CLR="\e[0m"

# Trap CTRL-C keypress and call terminate()
trap terminate INT

function terminate() {
  echo -e ""
  echo -e "[-] CTRL-C pressed, terminating."
  exit 1
}

echo -e "$FG_YLW[*] Update script Linux OS (debian-based)"
echo -e "[*] Version: 0.4"

# Set default values
YES=""

# Progress commandline arguments
while getopts :y flag; do
    case $flag in
      y)
        YES="-y"
	echo -e "[*] Continue without questions enabled, packages will be installed without notice"
	;;
      ?)
        echo "Invalid option: -${OPTARG}."
	exit 2
	;;
    esac
done

echo -e "$CLR"

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

echo -e ""
echo "[*] Finished."
