#!/bin/bash

[ -d $DIR/jenkins/work ] || mkdir $DIR/jenkins/work

$DOCKER run -i -t \
    --name="$container" \
    -h="$container.devcloud.com" \
    -p 8080:8080 -p 2222:22 \
    -v $DIR/jenkins/work:/home/jenkins \
    -d \
    "sdchua/$container"
