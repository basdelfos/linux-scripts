#!/bin/bash

#
# 0.1:  Initial version history

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

echo -e "$FG_YLW[*] Docker image update script"
echo -e "[*] Version: 0.1"
echo -e "$CLR"

images=`docker-compose images | sed 1,2d | awk '{ print $2 }'`

echo -e "[*] Found images in docker-compose:"
echo -e "$images"

echo $images | while read image
do
    echo -e ""
    echo -e "$FG_YLW[*] Processing image: $image $CLR"
    docker pull $image
done

echo -e ""
echo -e "$FG_YLW[*] Reconfiguring docker container$CLR"
docker-compose up -d

echo -e ""
echo -e "$FG_YLW[*] Prune not used docker images$CLR"
docker image prune -a -f
