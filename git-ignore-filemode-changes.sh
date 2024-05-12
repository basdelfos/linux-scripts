#!/bin/sh

if [ "$(git config core.fileMode)" == "false" ]; then
  echo "[*] Setting git repository to ignore filemode changes"
else
  echo "[-] Git already configured to ignore filemode changes"
fi
