#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -link mysql:db \
    -p 3000:3000 \
    -h="$container.devcloud.com" \
    -d \
    "sdchua/$container"
