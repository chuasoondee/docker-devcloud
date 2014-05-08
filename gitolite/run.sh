#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -d \
    "sdchua/$container"
