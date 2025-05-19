#!/bin/sh

DOT_FILE_PATH=$(dirname "$(readlink -f "$0")")

ln -sf $DOT_FILE_PATH/configs/zsh/zshrc ~/.zshrc
ln -sf $DOT_FILE_PATH/configs/git/.gitconfig ~/.gitconfig
