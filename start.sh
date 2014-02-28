#!/bin/bash
# set -e

DIR="$(cd "$(dirname "${BASE_SOURCE[0]}")" && pwd)"
DOCKER=`command -v docker` || exit 1

export PATH=$DIR/bin:$PATH

# build a docker image
function dbuild() {
    container=$1
    $DOCKER build -t "sdchua/$container" $DIR/$container
    return $?
}

# run a docker image
function drun() {
    container=$1
    . $DIR/$container/run.sh
}

# clean all ps
function dclean() {
    for i in `docker ps -a -q`; do
        docker rm $i
    done
}

