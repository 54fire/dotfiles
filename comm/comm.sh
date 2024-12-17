#!/bin/sh

install_deb() {
    if type $1 > /dev/null 2>&1; then
        echo "$1 is already installed"
    else
        sudo apt-get install -y $1
    fi
}

install_debs() {
    for deb in $@; do
        install_deb $deb
    done
}
