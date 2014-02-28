#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -p 8080:80 -p 2222:22 \
    -v $DIR/mirror:/repo \
    -rm=true \
    "sdchua/$container"
