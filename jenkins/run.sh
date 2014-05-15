#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container" \
    -p 8080:8080 \
    -v $VOL_HOME/jenkins:/home/jenkins \
    -d \
    "sdchua/$container"
