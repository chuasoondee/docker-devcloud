#!/bin/bash

# set -e

DIR="$(cd "$(dirname "${BASE_SOURCE[0]}")" && pwd)"
DOCKER=`command -v docker` || exit 1
VBOX=`command -v VBoxManage` || exit 1

# build a docker image
function dbuild() {
    container=$1
    $DOCKER build -t "sdchua/$container" $DIR/$container
    return $?
}

# run a docker image
function drun() {
    container=$1
    shift
    args=$@

    while test $# -gt 0; do
        case "$1" in
            -p)
                shift
                echo "$VBOX modifyvm 'boot2docker-vm' --natpf1 'tcp-port$1,tcp,,$1,,$1'"
                echo "$VBOX modifyvm 'boot2docker-vm' --natpf1 'udp-port$1,udp,,$1,,$1'"
                shift
                ;;
            *)
                break
                ;;
        esac
    done

    echo "$DOCKER run -h='$container.devcloud.com' -i -t --name='$container' $args 'sdchua/$container'"
    # $DOCKER run -h="$container.devcloud.com" -i -t --name="$container" "sdchua/$container"
    return $?
}

# clean all ps
function dclean() {
    for i in `docker ps -a -q`; do
        docker rm $i
    done
}

## Use `source start.sh` instead
# while test $# -gt 0; do
#     case "$1" in
#         -h|--help)
#             echo "Usage:"
#             exit 0
#             ;;
#         -b)
#             shift
#             if test $# -gt 0; then
#                 build $1
#             fi
#             shift
#             ;;
#         *)
#             break
#             ;;
#     esac
# done

