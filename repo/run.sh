#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -p 8080:80 \
    -v $DIR/mirror:/repo \
    -d \
    "sdchua/$container"

#$DIR/bin/pipework br1 $container 192.168.1.10
