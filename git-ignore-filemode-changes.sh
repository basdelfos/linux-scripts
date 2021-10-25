#!/bin/bash

if [ "$(git config core.fileMode)" == "false" ]; then
  echo "[*] Setting git repository to ignore filemode changes"
fi