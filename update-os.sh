#!/bin/bash

sudo apt update
echo '------'
sudo apt dist-upgrade -y
echo '------'
sudo apt autoremove -y
echo '------'
needs-reboot.sh