#!/bin/sh

echo -e "[*] Limit journal log to max. 200MB diskspace"
echo -e "[*] Version: 0.1"

#
# 0.1:    Initial version history

echo -e "[*] Checking if login with sudo is needed"
sudo echo -e ""

echo -e "[*] Current diskspace used by journal logs"
sudo journalctl --disk-usage
sudo echo -e ""

echo -e "[*] Set max diskspace for journal logs to 200MB"
sudo sed -i -e "s/#SystemMaxUse=/SystemMaxUse=200MB/g" /etc/systemd/journald.conf
sudo echo -e ""

echo -e "[*] Do a vacuum on journal logs to immediately shrink journal logs"
sudo journalctl --vacuum-size=200M
