#!/bin/sh

# Checks if a reboot is needed on Alpine Linux by comparing the kernelimage against the current loaded kernelimage.
#
# 0.1:  Initial version history

FG_RED="\e[1m\e[31m"
FG_YLW="\e[1m\e[33m"
FG_GRE="\e[1m\e[32m"
CLR="\e[0m"

([[ "$(uname -a)" == *"$(ls /boot/System.map* | head | cut -d'-' -f2-)"* ]] && echo -e "$FG_GRE[+] No reboot required$CLR" || echo -e "$FG_RED[!] Reboot required$CLR")
