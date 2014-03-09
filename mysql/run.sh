#!/bin/bash

$DOCKER run --name="$container" \
    -h="$container.devcloud.com" \
    -p 3306:3306 -p 2222:22 \
    -v $DIR/$container/work:/var/lib/mysql \
    -d \
    "sdchua/$container"
