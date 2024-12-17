#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0); pwd)
echo "DOTFILES_DIR: $DOTFILES_DIR"

. $DOTFILES_DIR/comm/comm.sh

install_debs iw 

# install zsh
