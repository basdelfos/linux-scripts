#!/bin/bash

images=`docker-compose images | sed 1,2d | awk '{ print $2 }'`

echo $images | while read image
do
    docker pull $image
done

docker-compose up -d
docker image prune -a -f
