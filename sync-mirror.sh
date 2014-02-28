#!/bin/bash

DIR="$(cd "$(dirname "${BASE_SOURCE[0]}")" && pwd)"
rsync --progress -av --delete --delete-excluded \
    --exclude "local*" \
    --exclude "isos" \
    --exclude "i386" \
    rsync://ossm.utm.my/centos/6.5/ \
    $DIR/mirror/centos/6.5/

rsync --progress -av --delete --delete-excluded \
    --exclude "ppc64" \
    --exclude "i386" \
    rsync://mirror.rndc.or.id/EPEL/6/ \
    $DIR/mirror/fedora/epel/6/
