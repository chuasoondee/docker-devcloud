#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -p 8080:80 \
    -v $DIR/mirror:/repo \
    -d \
    "sdchua/$container"
