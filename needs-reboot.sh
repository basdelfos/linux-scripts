#!/bin/bash

#
# 0.1:  Initial version history
# 0.2:	Added terminal colors

FG_RED="\e[1m\e[31m"
FG_YLW="\e[1m\e[33m"
FG_GRE="\e[1m\e[32m"
CLR="\e[0m"

([ -f /var/run/reboot-required ] && echo -e "$FG_RED[*] Reboot required$CLR" || echo -e "$FG_GRE[+] No reboot required$CLR")
