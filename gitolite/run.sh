#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -p 3022:22 \
    -d \
    "sdchua/$container"
