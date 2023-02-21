#!/bin/sh

set -e

cd /etc/update-motd.d

sh 00-header
sh 50-landscape-sysinfo
sh 85-fwupd
sh 90-updates-available
sh 91-release-upgrade
sh 92-unattended-upgrades
sh 98-fsck-at-reboot
sh 98-reboot-required
