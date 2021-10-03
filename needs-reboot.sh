#!/bin/bash

([ -f /var/run/reboot-required ] && echo '[*] Reboot required' || echo '[+] No reboot required')