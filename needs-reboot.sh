#!/bin/bash

#
# 0.1:    Initial version history

([ -f /var/run/reboot-required ] && echo '[*] Reboot required' || echo '[+] No reboot required')