#!/bin/bash

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -p 8080:8080 -p 2222:22 \
    -v $DIR/jenkins/home:/home/jenkins \
    -rm=true \
    "sdchua/$container"
