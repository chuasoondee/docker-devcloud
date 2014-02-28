#!/bin/bash

DIR="$(cd "$(dirname "${BASE_SOURCE[0]}")" && pwd)"
VM=`command -v VBoxManage` || exit 1

function vb() {
    vm="boot2docker-vm"
    action=$1
    shift
    args=$@
    [ $action == "-d" ] && vb_port_delete $vm $args
    [ $action == "-a" ] && vb_port_add $vm $args
}

function vb_port_delete() {
    vm=$1
    port=`echo $2 | cut -d':' -f1`

    echo "$vm" --natpf1 delete "tcp-port$port"
}

function vb_port_add() {
    vm=$1
    host_port=`echo $2 | cut -d':' -f1`
    container_port=`echo $2 | cut -d':' -f2`

    echo modifyvm "boot2docker-vm" --natpf1 "tcp-port$host_port,tcp,,$host_port,,$container_port"
    echo modifyvm "boot2docker-vm" --natpf1 "udp-port$host_port,udp,,$host_port,,$container_port"
}
